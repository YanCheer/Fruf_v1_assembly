echo 06.ncRNA_Annotation - 01.Target_Index_Build.sh Started at `date`; echo

InPre=m64144_221109_124515
# SAMPLE=WMS3MU01_Fulvetta_ruficapilla
SAMPLE=WMS3MU01

OutDir=/projects/yanchen/PRJ_Quemei/03.HiFi_Assembled_Results/WMS3MU01/04.Scaffolding/03.Scaffolded_Assembly_Annotation/ncRNA_Anno; mkdir -p $OutDir/Infernal

TargetGenome=/projects/yanchen/PRJ_Quemei/03.HiFi_Assembled_Results/WMS3MU01/04.Scaffolding/03.Scaffolded_Assembly_Annotation/earlGrey_Outs/fulvetta_ruficapilla_EarlGrey/fulvetta_ruficapilla_summaryFiles/fulvetta_ruficapilla.softmasked.fasta

RfamDir=/projects/yanchen/HiFi_tmp/01.HiFi_Assemble/Assemblies_hifiasm/02.Primary_Assembly_Annotation/Braker3_NewPR_0404/braker/GeMoMa/GeMoMa_temp/GeMoMaPipeline-5520111976855044556/ncRNA_Anno_AfterGeMoMa

source activate /projects/yanchen/softwares/miniconda3_v2/envs/Infernal

cd $OutDir/Infernal
gunzip  Rfam.cm.gz
cmpress Rfam.cm

cmscan -Z 2352 --cut_ga --rfam --nohmmonly --fmt 2 \
  --tblout ${SAMPLE}.tblout \
  -o       ${SAMPLE}.result \
  --clanin $RfamDir/Rfam.clanin \
  --cpu 128 \
  $RfamDir/Rfam.cm $TargetGenome



echo; echo 06.ncRNA_Annotation - 01.Target_Index_Build.sh Finished at `date`
