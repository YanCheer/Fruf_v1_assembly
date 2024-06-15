echo 05.Minimap2_Cov.sh Started at `date`; echo


InPre=m64144_221109_124515
# SAMPLE=WMS3MU01_Fulvetta_ruficapilla
SAMPLE=WMS3MU01

Asm_Dir=/projects/yanchen/PRJ_Quemei/03.HiFi_Assembled_Results/WMS3MU01/04.Scaffolding/03.Scaffolded_Assembly_Annotation/earlGrey_Outs/fulvetta_ruficapilla_EarlGrey/fulvetta_ruficapilla_summaryFiles
OutDir=$Asm_Dir

GenoDir=$Asm_Dir
Genome=$GenoDir/fulvetta_ruficapilla.softmasked.fasta

HiFiDir=/projects/yanchen/PRJ_Quemei/01.HiFi
HiFi_reads=$HiFiDir/$InPre.hifi_reads.fq.gz


cd $OutDir
source activate /projects/yanchen/softwares/miniconda3_v2/envs/hisat2
minimap2 -ax map-hifi      ${Genome} ${HiFi_reads}         -t 128 \
  |samtools sort -O BAM -o ${Genome}.hifi_reads.bam --threads 128 \
  >                        ${Genome}.hifi_reads.bam.minimap2.log 2>&1




echo; echo 05.Minimap2_Cov.sh Finished at `date`
 