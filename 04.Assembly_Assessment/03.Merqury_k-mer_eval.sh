echo 03.Merqury_k-mer_eval.sh Started at `date`; echo

InPre=m64144_221109_124515
SAMPLE=WMS3MU01

meryl_Dir=/projects/yanchen/PRJ_Quemei/01.HiFi
Asm_Dir=/projects/yanchen/PRJ_Quemei/03.HiFi_Assembled_Results/WMS3MU01
OutDir=$Asm_Dir/01.Merqury_outs; mkdir -p $OutDir


if [ ! -s $Asm_Dir/Pri_asm.fasta ]; then ln -s $Asm_Dir/${SAMPLE}.hifiasm.hic.p_ctg.fa $Asm_Dir/Pri_asm.fasta; fi
if [ ! -s $Asm_Dir/Alt_asm.fasta ]; then ln -s $Asm_Dir/${SAMPLE}.hifiasm.hic.a_ctg.fa $Asm_Dir/Alt_asm.fasta; fi


cd $OutDir
k=20; mkdir kmer${k}; cd kmer${k}; mkdir Pri_Alt_asm; mkdir Haps_asm

source activate /projects/yanchen/softwares/miniconda3/envs/merqury

cd Pri_Alt_asm
$MERQURY/merqury.sh $meryl_Dir/${SAMPLE}.kmer$k.meryl \
  $Asm_Dir/Pri_asm.fasta \
  $Asm_Dir/Alt_asm.fasta \
  kmer${k}_Pri_Alt_asm > kmer${k}_Pri_Alt_asm.log 
cd ..


echo; echo 03.Merqury_k-mer_eval.sh Finished at `date`
