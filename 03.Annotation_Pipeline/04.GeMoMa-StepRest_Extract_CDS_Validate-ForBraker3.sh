echo 04.GeMoMa-StepRest_Extract_CDS_Validate-ForBraker3.NewPR_0531 Started at `date`; echo


AsmDir=/projects/yanchen//03.HiFi_Assembled_Results/WMS3MU01/04.Scaffolding/03.Scaffolded_Assembly_Annotation/earlGrey_Outs/fulvetta_ruficapilla_EarlGrey/fulvetta_ruficapilla_summaryFiles
Asm_SoftMasked=$AsmDir/fulvetta_ruficapilla.softmasked.fasta
TargetGenome=${Asm_SoftMasked}

OutDir=/projects/yanchen//03.HiFi_Assembled_Results/WMS3MU01/04.Scaffolding/03.Scaffolded_Assembly_Annotation/Braker3_NewPR_0531/braker/GeMoMa

RootDir=/projects/yanchen
PepDir=$RootDir/Genomes/Proteins
All_Peps=$PepDir/Ready.fa

InPre=m64144_221109_124515
# SAMPLE=WMS3MU01_Fulvetta_ruficapilla
SAMPLE=WMS3MU01


RNAseqDir=$RootDir//Data/RNA_seq
RNAseqDir2=/projects/yanchen/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq

RefDir=/projects/yanchen/Genomes


cd $OutDir/GeMoMa_Outs
source activate /projects/yanchen/softwares/miniconda3_v2/envs/GeMoMa
GeMoMa=/projects/yanchen/softwares/miniconda3_v2/envs/GeMoMa/share/GeMoMa-1.9/GeMoMa-1.9.jar
java -Xms30G -Xmx50G -jar $GeMoMa CLI Extractor \
  Ambiguity=AMBIGUOUS \
  p=true c=true \
  g=$TargetGenome \
  a=./final_annotation.gff >./GeMoMa_Extractor.log 2>&1 &

source activate /projects/yanchen/softwares/miniconda3_v2/envs/busco5
odb10_Dir=/projects/yanchen/busco_db
busco -i ./proteins.fasta -f \
  -l $odb10_Dir/aves_odb10 \
  -m proteins \
  --out_path $OutDir/GeMoMa_Outs -o WMS3MU01_Fruf_Braker3_aves_odb10 \
  -c 123 --offline > BUSCO_completeness.WMS3MU01_Fruf_Braker3_aves_odb10.log 2>&1 &
conda deactivate

source activate /projects/yanchen/softwares/miniconda3_v2/envs/GeMoMa
GeMoMa=/projects/yanchen/softwares/miniconda3_v2/envs/GeMoMa/share/GeMoMa-1.9/GeMoMa-1.9.jar
java -Xms30G -Xmx50G -jar $GeMoMa CLI BUSCORecomputer \
  b=./WMS3MU01_Fruf_Braker3_aves_odb10/run_aves_odb10/full_table.tsv \
  i=./assignment.tabular \
  outdir=./proteins_BUSCORecomputer >proteins_BUSCORecomputer.log 2>&1 &


echo; echo 04.GeMoMa-StepRest_Extract_CDS_Validate-ForBraker3.NewPR_0531 Finished at `date`
