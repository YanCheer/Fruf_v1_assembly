#! /bin/bash

##############################################
# ARIMA GENOMICS MAPPING PIPELINE 07/26/2023 #
##############################################

# Below find the commands used to map HiC data.

# Replace the variables at the top with the correct paths for the locations of files/programs on your system.

# This bash script will map one paired end HiC dataset (read1 & read2 FASTQs). Feel to modify and multiplex as you see fit to work with your volume of samples and system.

##########################################
# Commands #
##########################################

SRA=E100057946_L01
LABEL=WMS3MU01_Fulvetta_ruficapilla
BWA=/projects/yanchen/softwares/bwa-0.7.17/bwa
SAMTOOLS=/cache7T/software/miniconda3-2/bin/samtools
IN_DIR=/projects/yanchen/PRJ_Quemei/02.HiC
REF=/projects/yanchen/PRJ_Quemei/03.HiFi_Assembled_Results/WMS3MU01/WMS3MU01.hifiasm.hic.p_ctg.fa
FAIDX=$REF.fai
PREFIX=$REF
RAW_DIR=/projects/yanchen/PRJ_Quemei/03.HiFi_Assembled_Results/WMS3MU01/04.Scaffolding/01.HiC_BAM
FILT_DIR=$RAW_DIR/Filtered
FILTER=/projects/yanchen/softwares/Arima_mapping_pipeline/filter_five_end.pl
COMBINER=/projects/yanchen/softwares/Arima_mapping_pipeline/two_read_bam_combiner.pl
STATS=/projects/yanchen/softwares/Arima_mapping_pipeline/get_stats.pl
PICARD=/projects/yanchen/softwares/picard-tools-1.119/picard-1.119.jar
PICARD_Dir=/projects/yanchen/softwares/picard-tools-1.119
TMP_DIR=/projects/yanchen/PRJ_Quemei/03.HiFi_Assembled_Results/WMS3MU01/04.Scaffolding/01.HiC_BAM/tmp_dir
PAIR_DIR=$RAW_DIR/Paired
REP_DIR=$RAW_DIR/DeDups
REP_LABEL=${LABEL}_rep1
MERGE_DIR=$RAW_DIR/Merged
MAPQ_FILTER=10
CPU=128

echo "### Step 0: Check output directories existence & create them as needed"
[ -d $RAW_DIR ] || mkdir -p $RAW_DIR
[ -d $FILT_DIR ] || mkdir -p $FILT_DIR
[ -d $TMP_DIR ] || mkdir -p $TMP_DIR
[ -d $PAIR_DIR ] || mkdir -p $PAIR_DIR
[ -d $REP_DIR ] || mkdir -p $REP_DIR
[ -d $MERGE_DIR ] || mkdir -p $MERGE_DIR

echo "### Step 0: Index reference" # Run only once! Skip this step if you have already generated BWA index files
$BWA index -a bwtsw -p $PREFIX $REF

echo "### Step 1.A: FASTQ to BAM (1st)"
$BWA mem -t $CPU $REF $IN_DIR/${SRA}_1.filer.fq.gz | $SAMTOOLS view -@ $CPU -Sb - > $RAW_DIR/${SRA}_1.bam

echo "### Step 1.B: FASTQ to BAM (2nd)"
$BWA mem -t $CPU $REF $IN_DIR/${SRA}_2.filer.fq.gz | $SAMTOOLS view -@ $CPU -Sb - > $RAW_DIR/${SRA}_2.bam

echo "### Step 2.A: Filter 5 end (1st)"
$SAMTOOLS view -h $RAW_DIR/${SRA}_1.bam | perl $FILTER | $SAMTOOLS view -Sb - > $FILT_DIR/${SRA}_1.bam

echo "### Step 2.B: Filter 5 end (2nd)"
$SAMTOOLS view -h $RAW_DIR/${SRA}_2.bam | perl $FILTER | $SAMTOOLS view -Sb - > $FILT_DIR/${SRA}_2.bam

echo "### Step 3A: Pair reads & mapping quality filter"
perl $COMBINER $FILT_DIR/${SRA}_1.bam $FILT_DIR/${SRA}_2.bam $SAMTOOLS $MAPQ_FILTER | $SAMTOOLS view -bS -t $FAIDX - | $SAMTOOLS sort -@ $CPU -o $TMP_DIR/$SRA.bam -

echo "### Step 3.B: Add read group"
java -Xmx120G -Djava.io.tmpdir=$TMP_DIR -jar $PICARD_Dir/AddOrReplaceReadGroups.jar INPUT=$TMP_DIR/$SRA.bam OUTPUT=$PAIR_DIR/$SRA.bam ID=$SRA LB=$SRA SM=$LABEL PL=ILLUMINA PU=none

###############################################################################################################################################################
###                                           How to Accommodate Technical Replicates                                                                       ###
### This pipeline is currently built for processing a single sample with one read1 and read2 FASTQ file.                                                    ###
### Technical replicates (eg. one library split across multiple lanes) should be merged before running the MarkDuplicates command.                          ###
### If this step is run, the names and locations of input files to subsequent steps will need to be modified in order for subsequent steps to run correctly.###
### The code below is an example of how to merge technical replicates.                                                                                      ###
###############################################################################################################################################################
#	REP_NUM=X # number of the technical replicate set e.g. 1
#	REP_LABEL=${LABEL}_rep$REP_NUM
#	INPUTS_TECH_REPS=(bash array of bams from replicates) # BAM files you want combined as technical replicates
#   example bash array - INPUTS_TECH_REPS=(INPUT=A.L1.bam INPUT=A.L2.bam INPUT=A.L3.bam)
#	java -Xmx8G -Djava.io.tmpdir=$TMP_DIR -jar $PICARD_Dir/MergeSamFiles.jar $INPUTS_TECH_REPS OUTPUT=$TMP_DIR/$REP_LABEL.bam USE_THREADING=TRUE ASSUME_SORTED=TRUE VALIDATION_STRINGENCY=LENIENT

echo "### Step 4: Mark duplicates"
java -Xmx300G -XX:-UseGCOverheadLimit -Djava.io.tmpdir=$TMP_DIR -jar $PICARD_Dir/MarkDuplicates.jar INPUT=$PAIR_DIR/$SRA.bam OUTPUT=$REP_DIR/$REP_LABEL.bam METRICS_FILE=$REP_DIR/metrics.$REP_LABEL.txt TMP_DIR=$TMP_DIR ASSUME_SORTED=TRUE VALIDATION_STRINGENCY=LENIENT REMOVE_DUPLICATES=TRUE

$SAMTOOLS index $REP_DIR/$REP_LABEL.bam

perl $STATS $REP_DIR/$REP_LABEL.bam > $REP_DIR/$REP_LABEL.bam.stats

echo "Finished Mapping Pipeline through Duplicate Removal"

#########################################################################################################################################
###                                       How to Accommodate Biological Replicates                                                    ###
### This pipeline is currently built for processing a single sample with one read1 and read2 FASTQ file.                              ###
### Biological replicates (eg. multiple libraries made from the same sample) should be merged before proceeding with subsequent steps.###
### The code below is an example of how to merge biological replicates.                                                               ###
#########################################################################################################################################
#
#	INPUTS_BIOLOGICAL_REPS=(bash array of bams from replicates) # BAM files you want combined as biological replicates
#   example bash array - INPUTS_BIOLOGICAL_REPS=(INPUT=A_rep1.bam INPUT=A_rep2.bam INPUT=A_rep3.bam)
#
#	java -Xmx8G -Djava.io.tmpdir=$TMP_DIR -jar $PICARD_Dir/MergeSamFiles.jar $INPUTS_BIOLOGICAL_REPS OUTPUT=$MERGE_DIR/$LABEL.bam USE_THREADING=TRUE ASSUME_SORTED=TRUE VALIDATION_STRINGENCY=LENIENT
#
#	$SAMTOOLS index $MERGE_DIR/$LABEL.bam

# perl $STATS $MERGE_DIR/$LABEL.bam > $MERGE_DIR/$LABEL.bam.stats

# echo "Finished Mapping Pipeline through merging Biological Replicates"
