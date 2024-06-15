echo 02.Assemble_HiFi_HiC_hifiasm.sh Started at `date`; echo

InDir=/projects/yanchen/PRJ_Quemei
OutDir=/projects/yanchen/PRJ_Quemei/03.HiFi_Assembled_Results; mkdir -p $OutDir

InPre=m64144_221109_124515.hifi_reads
SAMPLE=WMS3MU01; mkdir -p $OutDir/${SAMPLE}

HiFiIn=/projects/yanchen/PRJ_Quemei/01.HiFi/$InPre.fq.gz
HiCIn1=/projects/yanchen/PRJ_Quemei/02.HiC/E100057946_L01_1.filer.fq.gz
HiCIn2=/projects/yanchen/PRJ_Quemei/02.HiC/E100057946_L01_2.filer.fq.gz


cd $OutDir/WMS3MU01
hifiasm -o $OutDir/WMS3MU01/${SAMPLE}.hifiasm \
  --primary \
  --h1 $HiCIn1 \
  --h2 $HiCIn2 \
  -t 123 \
  $HiFiIn  > ${SAMPLE}.02.Assemble_HiFi_HiC_hifiasm.sh.log 2>&1 
  
awk '/^S/{print ">"$2;print $3}' ./${SAMPLE}.hifiasm.hic.p_ctg.gfa      > ./${SAMPLE}.hifiasm.hic.p_ctg.fa
awk '/^S/{print ">"$2;print $3}' ./${SAMPLE}.hifiasm.hic.a_ctg.gfa      > ./${SAMPLE}.hifiasm.hic.a_ctg.fa



echo; echo 02.Assemble_HiFi_HiC_hifiasm.sh Finished at `date`
