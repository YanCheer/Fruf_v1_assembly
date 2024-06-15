echo 06.ncRNA_Annotation - 02.Infernal2Gff.sh Started at `date`; echo

InPre=m64144_221109_124515
# SAMPLE=WMS3MU01_Fulvetta_ruficapilla
SAMPLE=WMS3MU01


OutDir=/projects/yanchen/PRJ_Quemei/03.HiFi_Assembled_Results/WMS3MU01/04.Scaffolding/03.Scaffolded_Assembly_Annotation/ncRNA_Anno; mkdir -p $OutDir/Infernal

RNAseqDir=/projects/yanchen/HiFi_tmp/01.HiFi_Assemble/Assemblies_hifiasm/02.Primary_Assembly_Annotation/Denovo_prediction/01.hisat2/03.bam
RNAseqDir2=/projects/yanchen/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq

TargetGenome=/projects/yanchen/PRJ_Quemei/03.HiFi_Assembled_Results/WMS3MU01/04.Scaffolding/03.Scaffolded_Assembly_Annotation/earlGrey_Outs/fulvetta_ruficapilla_EarlGrey/fulvetta_ruficapilla_summaryFiles/fulvetta_ruficapilla.softmasked.fasta

RfamDir=/projects/yanchen/HiFi_tmp/01.HiFi_Assemble/Assemblies_hifiasm/02.Primary_Assembly_Annotation/Braker3_NewPR_0404/braker/GeMoMa/GeMoMa_temp/GeMoMaPipeline-5520111976855044556/ncRNA_Anno_AfterGeMoMa

ScriptDir=/projects/yanchen/PRJ_Quemei/00.Scripts/07.Annotation_Pipeline/09.ncRNA_Annotation


cd $OutDir/Infernal
source activate /projects/yanchen/softwares/miniconda3_v2/envs/Infernal
$ScriptDir/infernal-tblout2gff.pl --cmscan --fmt2 ${SAMPLE}.tblout > ${SAMPLE}.Infernal.ncRNA.gff3



echo; echo 06.ncRNA_Annotation - 02.Infernal2Gff.sh Finished at `date`
