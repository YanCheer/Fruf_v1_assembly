echo 03.Juicertools_AfterYaHS.sh Started at `date`; echo

InPre=m64144_221109_124515.hifi_reads
SAMPLE=WMS3MU01
HiC_Pre=E100057946_L01

Asm_Dir=/projects/yanchen/PRJ_02.Quemei/03.HiFi_Assembled_Results/${SAMPLE}
HiCDir=$Asm_Dir/04.Scaffolding/01.HiC_BAM
OutDir=$Asm_Dir/04.Scaffolding/02.After_Scaffolding; mkdir -p $OutDir
ScriptDir=/projects/yanchen/PRJ_02.Quemei/00.Scripts/05.Scaffolding_by_YaHS


HiFiIn=/projects/yanchen/PRJ_02.Quemei/01.HiFi/m64144_221109_124515.hifi_reads.fq.gz
HiCIn1=/projects/yanchen/PRJ_02.Quemei/02.HiC/E100057946_L01_1.filer.fq.gz
HiCIn2=/projects/yanchen/PRJ_02.Quemei/02.HiC/E100057946_L01_2.filer.fq.gz


JavaDir=/projects/yanchen/softwares/yahs


cd $OutDir
###############################################################################
### Step 3. Juicer pre to convert HiC align to juicer_tools ###
juicer pre $OutDir/${SAMPLE}.hifiasm.hic.p_ctg.Scaffolded.bin \
           $OutDir/${SAMPLE}.hifiasm.hic.p_ctg.Scaffolded_scaffolds_final.agp \
          $Asm_Dir/${SAMPLE}.hifiasm.hic.p_ctg.fa.fai \
  |sort -k2,2d -k6,6d -T ./ --parallel=128 -S256G \
  |awk 'NF' > $OutDir/${SAMPLE}.alignments_sorted.txt.part
mv $OutDir/${SAMPLE}.alignments_sorted.txt.part $OutDir/${SAMPLE}.alignments_sorted.txt

### Step 4. Juicer_tools to generate HiC contact matrix ###
java -jar -Xms128G -Xmx256G $JavaDir/juicer_tools.2.20.00.jar \
   pre $OutDir/${SAMPLE}.alignments_sorted.txt \
       $OutDir/${SAMPLE}.out.hic.part \
	   $OutDir/${SAMPLE}.hifiasm.hic.p_ctg.Scaffolded_scaffolds_final.fa.fai.chrom.sizes
mv $OutDir/${SAMPLE}.out.hic.part $OutDir/${SAMPLE}.out.hic



echo; echo 03.Juicertools_AfterYaHS.sh Finished at `date`
