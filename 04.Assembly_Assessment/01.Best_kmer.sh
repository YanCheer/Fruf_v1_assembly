echo 01.Best_kmer.sh Started at `date`; echo


InDir=/projects/yanchen/PRJ_Quemei/01.HiFi

InPre=m64144_221109_124515
SAMPLE=WMS3MU01

source activate /projects/yanchen/softwares/miniconda3/envs/merqury
sh $MERQURY/best_k.sh ${Assembly_Size} 


echo; echo 01.Best_kmer.sh Finished at `date`
