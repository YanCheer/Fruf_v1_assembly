Anno_Gene_Names=read.table("Anno_Gene_Names.txt", header=T, sep="\t")
Anno_Gene_Names$Gene=rep("-",length(Anno_Gene_Names[,1]))

for(line in 1:length(Anno_Gene_Names[,1])){
if(Anno_Gene_Names[line,2]=="" & Anno_Gene_Names[line,3]=="" & Anno_Gene_Names[line,4]==""){Anno_Gene_Names$Gene[line]="-"}

if(Anno_Gene_Names[line,2]!="" & Anno_Gene_Names[line,3]=="" & Anno_Gene_Names[line,4]==""){Anno_Gene_Names$Gene[line]=toupper(Anno_Gene_Names[line,2])}
if(Anno_Gene_Names[line,2]=="" & Anno_Gene_Names[line,3]!="" & Anno_Gene_Names[line,4]==""){Anno_Gene_Names$Gene[line]=toupper(Anno_Gene_Names[line,3])}
if(Anno_Gene_Names[line,2]=="" & Anno_Gene_Names[line,3]=="" & Anno_Gene_Names[line,4]!=""){Anno_Gene_Names$Gene[line]=toupper(Anno_Gene_Names[line,4])}

if(Anno_Gene_Names[line,2]!="" & Anno_Gene_Names[line,3]!="" & Anno_Gene_Names[line,4]==""){
  if(toupper(Anno_Gene_Names[line,2])==toupper(Anno_Gene_Names[line,3])){Anno_Gene_Names$Gene[line]=toupper(Anno_Gene_Names[line,2])}
  if(toupper(Anno_Gene_Names[line,2])!=toupper(Anno_Gene_Names[line,3])){Anno_Gene_Names$Gene[line]=toupper(Anno_Gene_Names[line,3])}
}
if(Anno_Gene_Names[line,2]!="" & Anno_Gene_Names[line,3]=="" & Anno_Gene_Names[line,4]!=""){
  if(toupper(Anno_Gene_Names[line,2])==toupper(Anno_Gene_Names[line,4])){Anno_Gene_Names$Gene[line]=toupper(Anno_Gene_Names[line,2])}
  if(toupper(Anno_Gene_Names[line,2])!=toupper(Anno_Gene_Names[line,4])){Anno_Gene_Names$Gene[line]=toupper(Anno_Gene_Names[line,4])}
}
if(Anno_Gene_Names[line,2]=="" & Anno_Gene_Names[line,3]!="" & Anno_Gene_Names[line,4]!=""){
  if(toupper(Anno_Gene_Names[line,3])==toupper(Anno_Gene_Names[line,4])){Anno_Gene_Names$Gene[line]=toupper(Anno_Gene_Names[line,3])}
  if(toupper(Anno_Gene_Names[line,3])!=toupper(Anno_Gene_Names[line,4])){Anno_Gene_Names$Gene[line]=toupper(Anno_Gene_Names[line,3])}
}


if(Anno_Gene_Names[line,2]!="" & Anno_Gene_Names[line,3]!="" & Anno_Gene_Names[line,4]!=""){
  if(toupper(Anno_Gene_Names[line,2])==toupper(Anno_Gene_Names[line,3]) & toupper(Anno_Gene_Names[line,3])==toupper(Anno_Gene_Names[line,4])){Anno_Gene_Names$Gene[line]=toupper(Anno_Gene_Names[line,3])}
  if(toupper(Anno_Gene_Names[line,2])==toupper(Anno_Gene_Names[line,3]) & toupper(Anno_Gene_Names[line,3])!=toupper(Anno_Gene_Names[line,4])){Anno_Gene_Names$Gene[line]=toupper(Anno_Gene_Names[line,3])}
  if(toupper(Anno_Gene_Names[line,2])!=toupper(Anno_Gene_Names[line,3]) & toupper(Anno_Gene_Names[line,3])==toupper(Anno_Gene_Names[line,4])){Anno_Gene_Names$Gene[line]=toupper(Anno_Gene_Names[line,3])}
  if(toupper(Anno_Gene_Names[line,2])!=toupper(Anno_Gene_Names[line,3]) & toupper(Anno_Gene_Names[line,2])==toupper(Anno_Gene_Names[line,4])){Anno_Gene_Names$Gene[line]=toupper(Anno_Gene_Names[line,4])}
}
}

write.table(Anno_Gene_Names, "Anno_Gene_Names.OneName.txt", quote=F, sep="\t", col.names=T, row.names=F)

