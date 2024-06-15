echo 04.BUSCO_completeness.sh Started at `date`; echo

InPre=m64144_221109_124515
SAMPLE=WMS3MU01

Asm_Dir=/projects/yanchen/PRJ_Quemei/03.HiFi_Assembled_Results/WMS3MU01
OutDir=$Asm_Dir/02.BUSCO_Completeness; mkdir -p $OutDir; cd $OutDir

if [ ! -s $Asm_Dir/Pri_asm.fasta ]; then ln -s $Asm_Dir/${SAMPLE}.hifiasm.hic.p_ctg.fa $Asm_Dir/Pri_asm.fasta; fi
if [ ! -s $Asm_Dir/Alt_asm.fasta ]; then ln -s $Asm_Dir/${SAMPLE}.hifiasm.hic.a_ctg.fa $Asm_Dir/Alt_asm.fasta; fi

GenoDir=$Asm_Dir

odb10_Dir=/projects/yanchen/busco_db

source activate /projects/yanchen/softwares/miniconda3/envs/busco5

Genome=$GenoDir/Pri_asm.fasta
busco -i $Genome -f \
  -l $odb10_Dir/aves_odb10 \
  -m genome \
  --out_path $OutDir -o ${SAMPLE}_Fulvetta_ruficapilla_aves_odb10 \
  -c 128 --offline > BUSCO_completeness.${SAMPLE}_Fulvetta_ruficapilla_Pri_asm_aves_odb10.log 2>&1 


echo; echo 04.BUSCO_completeness.sh Finished at `date`
