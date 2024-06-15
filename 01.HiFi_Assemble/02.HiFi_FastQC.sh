echo 02.HiFi_FastQC.sh Started at `date`; echo

InDir=/home/yanc/m64144_221109_124515
OutDir=/projects/yanchen/PRJ_Quemei/01.HiFi; mkdir -p $OutDir

InPre=m64144_221109_124515.hifi_reads

cd $OutDir

fastqc -t 128 -o ./fastQC ${InPre}.fq.gz > ./fastQC/00.HiFi_FastQC.sh.log 2>&1 &



echo; echo 02.HiFi_FastQC.sh Finished at `date`
