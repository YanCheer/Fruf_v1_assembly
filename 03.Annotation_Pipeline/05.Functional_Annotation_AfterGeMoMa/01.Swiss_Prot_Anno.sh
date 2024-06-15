echo 05.Functional_Annotation_AfterGeMoMa - 01.Swiss_Prot_Anno.sh Started at `date`; echo


OutDir=/projects/yanchen/PRJ_Quemei/03.HiFi_Assembled_Results/WMS3MU01/04.Scaffolding/03.Scaffolded_Assembly_Annotation/Braker3_NewPR_0531/braker/GeMoMa/GeMoMa_Outs
mkdir -p $OutDir/Function_Anno_AfterGeMoMa/Swiss_Prot_Anno

InPre=m64144_221109_124515
# SAMPLE=WMS3MU01_Fulvetta_ruficapilla
SAMPLE=WMS3MU01

cd $OutDir/Function_Anno_AfterGeMoMa/Swiss_Prot_Anno
source activate /projects/yanchen/softwares/miniconda3_v2/envs/GeMoMa
GeMoMa=/projects/yanchen/softwares/miniconda3_v2/envs/GeMoMa/share/GeMoMa-1.9/GeMoMa-1.9.jar

gzip -dc uniprot_sprot.fasta.gz > uniprot_sprot.fasta
diamond makedb --in uniprot_sprot.fasta --db uniprot_sprot  #建库
ln -s /projects/yanchen/HiFi_tmp/01.HiFi_Assemble/Assemblies_hifiasm/02.Primary_Assembly_Annotation/Braker3_NewPR_0404/braker/GeMoMa/GeMoMa_Outs/Function_Anno_AfterGeMoMa/Swiss_Prot_Anno/uniprot_sprot.dmnd ./uniprot_sprot.dmnd
diamond blastp --db uniprot_sprot.dmnd \
  --query ../../proteins.fasta \
  --outfmt 6 qseqid qlen qstart qend sseqid slen sstart send pident ppos gaps length bitscore evalue qtitle stitle \
  --evalue 1e-5 --max-target-seqs 1 \
  --out Swissprot.blast.xls \
  --threads 128


echo; echo 05.Functional_Annotation_AfterGeMoMa - 01.Swiss_Prot_Anno.sh Finished at `date`
