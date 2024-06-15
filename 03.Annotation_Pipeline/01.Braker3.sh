echo 01.Braker3.sh Started at `date`; echo
##Braker3


AsmDir=/projects/yanchen/PRJ_Quemei/03.HiFi_Assembled_Results/WMS3MU01/04.Scaffolding/03.Scaffolded_Assembly_Annotation/earlGrey_Outs/fulvetta_ruficapilla_EarlGrey/fulvetta_ruficapilla_summaryFiles
Asm_SoftMasked=$AsmDir/fulvetta_ruficapilla.softmasked.fasta

OutDir=/projects/yanchen/PRJ_Quemei/03.HiFi_Assembled_Results/WMS3MU01/04.Scaffolding/03.Scaffolded_Assembly_Annotation; mkdir -p $OutDir/Braker3

RootDir=/projects/yanchen
PepDir=$RootDir/Genomes/Proteins
All_Peps=$PepDir/Ready.fa

InPre=m64144_221109_124515
# SAMPLE=WMS3MU01_Fulvetta_ruficapilla
SAMPLE=WMS3MU01


source activate /projects/yanchen/softwares/miniconda3_v2/envs/braker
cd $OutDir/Braker3
braker.pl --gff3 --threads 48 \
  --nocleanup \
  --GENEMARK_PATH=/projects/yanchen/softwares/GeneMark-ETP/bin \
  --PROTHINT_PATH=/projects/yanchen/softwares/ProtHint-master/bin \
  --species=Fulvetta_ruficapilla --useexisting \
  --genome=$Asm_SoftMasked \
  --prot_seq=$All_Peps \
  --bam=$RootDir/PRJ_Quemei/Data/RNA_seq/Unknown_BF174-01T0001_good.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/ERR12141281/ERR12141281.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/ERR12141282/ERR12141282.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/ERR12141283/ERR12141283.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR10852789/SRR10852789.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR10852802/SRR10852802.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR10852816/SRR10852816.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR10852819/SRR10852819.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR10852823/SRR10852823.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR10852830/SRR10852830.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR10852878/SRR10852878.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR10852881/SRR10852881.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR10852888/SRR10852888.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR10852898/SRR10852898.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR10852940/SRR10852940.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR10852954/SRR10852954.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR10852961/SRR10852961.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR10852974/SRR10852974.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR10852978/SRR10852978.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR10853003/SRR10853003.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR10853012/SRR10853012.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR10853039/SRR10853039.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR10853040/SRR10853040.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR10853071/SRR10853071.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR10853098/SRR10853098.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR13435174/SRR13435174.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR13435179/SRR13435179.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290185/SRR17290185.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290186/SRR17290186.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290187/SRR17290187.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290188/SRR17290188.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290189/SRR17290189.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290190/SRR17290190.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290191/SRR17290191.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290192/SRR17290192.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290193/SRR17290193.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290194/SRR17290194.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290195/SRR17290195.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290196/SRR17290196.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290197/SRR17290197.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290198/SRR17290198.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290199/SRR17290199.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290200/SRR17290200.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290201/SRR17290201.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290202/SRR17290202.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290203/SRR17290203.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290204/SRR17290204.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290205/SRR17290205.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290206/SRR17290206.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290207/SRR17290207.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290208/SRR17290208.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290209/SRR17290209.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290210/SRR17290210.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290211/SRR17290211.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290212/SRR17290212.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290213/SRR17290213.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290214/SRR17290214.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290215/SRR17290215.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290216/SRR17290216.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290217/SRR17290217.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290218/SRR17290218.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290219/SRR17290219.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290220/SRR17290220.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290221/SRR17290221.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290222/SRR17290222.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290223/SRR17290223.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR17290224/SRR17290224.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR18825690/SRR18825690.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR18825691/SRR18825691.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR18825692/SRR18825692.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR18825693/SRR18825693.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR18825694/SRR18825694.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR18825695/SRR18825695.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR18825696/SRR18825696.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR18825700/SRR18825700.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR18825706/SRR18825706.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR18825707/SRR18825707.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR18825711/SRR18825711.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR18825712/SRR18825712.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR19845258/SRR19845258.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR19845259/SRR19845259.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR21278276/SRR21278276.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601617/SRR24601617.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601618/SRR24601618.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601619/SRR24601619.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601620/SRR24601620.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601621/SRR24601621.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601622/SRR24601622.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601623/SRR24601623.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601624/SRR24601624.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601625/SRR24601625.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601626/SRR24601626.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601627/SRR24601627.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601628/SRR24601628.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601629/SRR24601629.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601630/SRR24601630.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601631/SRR24601631.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601632/SRR24601632.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601633/SRR24601633.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601634/SRR24601634.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601636/SRR24601636.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601637/SRR24601637.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601638/SRR24601638.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601639/SRR24601639.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601640/SRR24601640.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601641/SRR24601641.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601642/SRR24601642.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601643/SRR24601643.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601644/SRR24601644.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601645/SRR24601645.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601646/SRR24601646.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601647/SRR24601647.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601648/SRR24601648.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601649/SRR24601649.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601650/SRR24601650.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601651/SRR24601651.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601652/SRR24601652.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601653/SRR24601653.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601654/SRR24601654.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24601655/SRR24601655.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772313/SRR24772313.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772314/SRR24772314.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772316/SRR24772316.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772319/SRR24772319.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772320/SRR24772320.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772321/SRR24772321.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772322/SRR24772322.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772323/SRR24772323.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772325/SRR24772325.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772326/SRR24772326.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772327/SRR24772327.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772328/SRR24772328.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772329/SRR24772329.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772330/SRR24772330.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772331/SRR24772331.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772333/SRR24772333.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772334/SRR24772334.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772335/SRR24772335.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772336/SRR24772336.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772337/SRR24772337.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772339/SRR24772339.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772340/SRR24772340.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772341/SRR24772341.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772342/SRR24772342.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772343/SRR24772343.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772344/SRR24772344.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772345/SRR24772345.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772346/SRR24772346.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772347/SRR24772347.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772348/SRR24772348.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772349/SRR24772349.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772350/SRR24772350.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772351/SRR24772351.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772352/SRR24772352.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772353/SRR24772353.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772355/SRR24772355.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772356/SRR24772356.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772357/SRR24772357.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772358/SRR24772358.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772359/SRR24772359.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772360/SRR24772360.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772361/SRR24772361.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772362/SRR24772362.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772363/SRR24772363.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772364/SRR24772364.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772366/SRR24772366.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772367/SRR24772367.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772369/SRR24772369.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772370/SRR24772370.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772371/SRR24772371.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772372/SRR24772372.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772373/SRR24772373.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR24772374/SRR24772374.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR25341904/SRR25341904.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR3476292/SRR3476292.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR3493972/SRR3493972.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR3901721/SRR3901721.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR6760973/SRR6760973.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR6760974/SRR6760974.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR6760979/SRR6760979.sorted.bam,$RootDir/HiFi_tmp/Other_Passeri_RNA/Out_RNAseq/SRR6760980/SRR6760980.sorted.bam > Braker3.log 2>&1 &


echo; echo 01.Braker3.sh Finished at `date`
