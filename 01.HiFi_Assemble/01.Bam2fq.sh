echo 01.Bam2fq.sh Started at `date`; echo


InDir=/home/yanc/m64144_221109_124515
OutDir=/projects/yanchen/PRJ_Quemei/01.HiFi; mkdir -p $OutDir

InPre=m64144_221109_124515.hifi_reads

cd $OutDir
samtools bam2fq $InDir/$InPre.bam |bgzip -c > $OutDir/$InPre.fq.gz 



echo; echo 01.Bam2fq.sh Finished at `date`
