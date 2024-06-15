echo 01.Arima_Hi-C_mapping.sh Started at `date`; echo


RootDir=/projects/yanchen/PRJ_Quemei
HiFiDir=$RootDir/01.HiFi
HiC_Dir=$RootDir/02.HiC
Asm_Dir=$RootDir/03.HiFi_Assembled_Results/WMS3MU01
OutDir=$Asm_Dir/03.HiFi_Assembled_Results/WMS3MU01/04.Scaffolding/01.HiC_BAM
mkdir -p $OutDir; cd $OutDir
ScriptDir=$RootDir/00.Scripts/05.Scaffolding_by_YaHS

InPre=m64144_221109_124515.hifi_reads
SAMPLE=WMS3MU01
HiC_Pre=E100057946_L01

HiFiIn=/projects/yanchen/PRJ_Quemei/01.HiFi/m64144_221109_124515.hifi_reads.fq.gz
HiCIn1=/projects/yanchen/PRJ_Quemei/02.HiC/E100057946_L01_1.filer.fq.gz
HiCIn2=/projects/yanchen/PRJ_Quemei/02.HiC/E100057946_L01_2.filer.fq.gz

###############################################################################
### Step 0. Assembly Indexing ###
samtools faidx $Asm_Dir/${SAMPLE}.hifiasm.hic.p_ctg.fa

### Step 1. Arima mapping pipeline Running as A Whole ###
sh $ScriptDir/arima_mapping_pipeline.sh > $ScriptDir/arima_mapping_pipeline.sh.log 2>&1


echo; echo 01.Arima_Hi-C_mapping.sh Finished at `date`
