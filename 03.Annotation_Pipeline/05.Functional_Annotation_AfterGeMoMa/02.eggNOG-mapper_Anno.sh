echo 05.Functional_Annotation_AfterGeMoMa - 02.eggNOG-mapper_Anno.sh Started at `date`; echo


OutDir=/projects/yanchen/PRJ_Quemei/03.HiFi_Assembled_Results/WMS3MU01/04.Scaffolding/03.Scaffolded_Assembly_Annotation/Braker3_NewPR_0531/braker/GeMoMa/GeMoMa_Outs
mkdir -p $OutDir/Function_Anno_AfterGeMoMa/eggNOG-mapper_Anno
InDir=/projects/yanchen/PRJ_Quemei/03.HiFi_Assembled_Results/WMS3MU01/04.Scaffolding/03.Scaffolded_Assembly_Annotation/Braker3_NewPR_0531/braker/GeMoMa/GeMoMa_Outs

InPre=m64144_221109_124515
# SAMPLE=WMS3MU01_Fulvetta_ruficapilla
SAMPLE=WMS3MU01

GFF=$InDir/final_annotation.gff
Prots=$InDir/proteins.fasta

cd $OutDir/Function_Anno_AfterGeMoMa/eggNOG-mapper_Anno
source activate /projects/yanchen/softwares/miniconda3_v2/envs/eggNOG-mapper
export EGGNOG_DATA_DIR=/cache7T/yanchen/eggnog-mapper-data_db

emapper.py --mp_start_method forkserver \
  --itype proteins -i ${Prots} \
  --tax_scope 8782 \
  -o eggNOG_mapper_out --output_dir $OutDir/Function_Anno_AfterGeMoMa/eggNOG-mapper_Anno \
  --temp_dir                        $OutDir/Function_Anno_AfterGeMoMa/eggNOG-mapper_Anno \
  --override \
  -m diamond --dmnd_ignore_warnings \
  --evalue 0.001 --score 60 --pident 40 --query_cover 20 --subject_cover 20 \
  --target_orthologs one2one \
  --go_evidence non-electronic \
  --pfam_realign realign \
  --report_orthologs \
  --decorate_gff ${GFF} \
  --excel \
  --cpu 128  > $OutDir/Function_Anno_AfterGeMoMa/eggNOG-mapper_Anno/eggNOG_mapper.log \
            2> $OutDir/Function_Anno_AfterGeMoMa/eggNOG-mapper_Anno/eggNOG_mapper.err  



echo; echo 05.Functional_Annotation_AfterGeMoMa - 02.eggNOG-mapper_Anno.sh Finished at `date`
