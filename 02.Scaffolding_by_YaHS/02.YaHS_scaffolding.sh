echo 02.YaHS_scaffolding.sh Started at `date`; echo

InPre=m64144_221109_124515.hifi_reads
SAMPLE=WMS3MU01
HiC_Pre=E100057946_L01

Asm_Dir=/projects/yanchen/PRJ_Quemei/03.HiFi_Assembled_Results/${SAMPLE}
HiCDir=$Asm_Dir/04.Scaffolding/01.HiC_BAM
OutDir=$Asm_Dir/04.Scaffolding/02.After_Scaffolding; mkdir -p $OutDir
ScriptDir=/projects/yanchen/PRJ_Quemei/00.Scripts/05.Scaffolding_by_YaHS


HiFiIn=/projects/yanchen/PRJ_Quemei/01.HiFi/m64144_221109_124515.hifi_reads.fq.gz
HiCIn1=/projects/yanchen/PRJ_Quemei/02.HiC/E100057946_L01_1.filer.fq.gz
HiCIn2=/projects/yanchen/PRJ_Quemei/02.HiC/E100057946_L01_2.filer.fq.gz


cd $OutDir
###############################################################################
### Step 2. YaHS Hi-C Scaffolding ###
yahs $Asm_Dir/${SAMPLE}.hifiasm.hic.p_ctg.fa \
     $HiCDir/DeDups/${SAMPLE}_Fulvetta_ruficapilla_rep1.bam \
	 -e GATC \
	 -o ./${SAMPLE}.hifiasm.hic.p_ctg.Scaffolded



echo; echo 02.YaHS_scaffolding.sh Finished at `date`
