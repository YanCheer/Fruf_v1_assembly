echo 00.Repeat_elements_Anno.sh - earlGrey  Started at `date`; echo

InPre=m64144_221109_124515
# SAMPLE=WMS3MU01_Fulvetta_ruficapilla
SAMPLE=WMS3MU01

OutDir=/projects/yanchen/PRJ_Quemei/03.HiFi_Assembled_Results/WMS3MU01/04.Scaffolding/03.Scaffolded_Assembly_Annotation/earlGrey_Outs; mkdir -p $OutDir

OriginalGenome=/projects/yanchen/PRJ_Quemei/03.HiFi_Assembled_Results/WMS3MU01/04.Scaffolding/02.After_Scaffolding/${SAMPLE}.hifiasm.hic.p_ctg.Scaffolded_scaffolds_final.fa

cd $OutDir
source activate /projects/yanchen/softwares/miniconda3_v2/envs/EarlGrey

earlGrey -g $OriginalGenome \
  -s 'fulvetta_ruficapilla' \
  -r 'fulvetta_ruficapilla' \
  -o $OutDir \
  -d yes \
  -t 128 



echo; echo 00.Repeat_elements_Anno.sh - earlGrey  Finished at `date`
