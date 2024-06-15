echo 02.Extract_CDS_Validate-ForBraker3.sh Started at `date`; echo


AsmDir=/projects/yanchen/PRJ_Quemei/03.HiFi_Assembled_Results/WMS3MU01/04.Scaffolding/03.Scaffolded_Assembly_Annotation/earlGrey_Outs/fulvetta_ruficapilla_EarlGrey/fulvetta_ruficapilla_summaryFiles
Asm_SoftMasked=$AsmDir/fulvetta_ruficapilla.softmasked.fasta

OutDir=/projects/yanchen/PRJ_Quemei/03.HiFi_Assembled_Results/WMS3MU01/04.Scaffolding/03.Scaffolded_Assembly_Annotation/Braker3/braker; mkdir -p $OutDir

RootDir=/projects/yanchen
PepDir=$RootDir/Genomes/Proteins
All_Peps=$PepDir/Ready.fa

InPre=m64144_221109_124515
# SAMPLE=WMS3MU01_Fulvetta_ruficapilla
SAMPLE=WMS3MU01


cd $OutDir
source activate /projects/yanchen/softwares/miniconda3_v2/envs/busco5
odb10_Dir=/projects/yanchen/busco_db
busco -i $OutDir/braker.aa -f \
  -l $odb10_Dir/aves_odb10 \
  -m proteins \
  --out_path $OutDir -o WMS3MU01_Fruf_Braker3_aves_odb10 \
  -c 128 --offline > BUSCO_completeness.WMS3MU01_Fruf_Braker3_aves_odb10.log 2>&1 


echo; echo 02.Extract_CDS_Validate-ForBraker3.sh Finished at `date`
