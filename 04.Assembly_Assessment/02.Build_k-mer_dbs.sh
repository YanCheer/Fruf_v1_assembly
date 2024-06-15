echo 02.Build_k-mer_dbs.sh Started at `date`; echo


InDir=/projects/yanchen/PRJ_Quemei/01.HiFi
OutDir=$InDir; mkdir -p $OutDir

InPre=m64144_221109_124515
SAMPLE=WMS3MU01

cd $OutDir

source activate /projects/yanchen/softwares/miniconda3/envs/merqury
k=20
meryl k=$k count $InDir/$InPre.hifi_reads.fq.gz output $OutDir/$SAMPLE.kmer$k.meryl > $OutDir/$SAMPLE.kmer$k.meryl.log 2>&1 



echo; echo 02.Build_k-mer_dbs.sh Finished at `date`
