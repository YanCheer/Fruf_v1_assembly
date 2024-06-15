#!/usr/bin/python3
#-*- coding:UTF-8 -*-
# Usage: python Add_Gene_Names_in_Gff.py Query.gff Anno_Gene_Names.OneName.txt New.gff

import re
import sys

args=sys.argv

Gene_Anno=open(args[2], 'r')
Gene_Anno_dict={}
Gff=open(args[1], 'r')
New_Gff=open(args[3], 'w')

for line in Gene_Anno:
    Trans=line.split('\t')[0]
    # GeneN=line.split('\t')[1]
    Gene_Anno_dict[Trans]=line.split('\t')[1]
    # # print(Trans+'\t'+Gene_Anno_dict[Trans])
Gene_Anno.close()

for line in Gff:
    if line.startswith('#'):
        New_Gff.write(line)
    else:
        catogr=line.split('\t')[2]
        attr=line.split('\t')[8].strip()
        if catogr=="gene":
            New_Gff.write('\t'.join(line.split('\t')[0:8]) + '\t' + attr + '\n')
        # if catogr!="mRNA":
            # New_Gff.write('\t'.join(line.split('\t')[0:8]) + '\t' + attr + '\n')
        elif catogr=="mRNA":
            # pattern_GeneID=r';Parent=(?P<GeneID>gene_[0-9]+);'
            # match_GeneID=re.search(pattern_GeneID, attr)
            pattern_TransID=r'ID=(?P<TransID>[^;\s]+);'
            match_TransID=re.search(pattern_TransID, attr)
            # # print(match_TransID.group('TransID'))
            if match_TransID:
                GeneName=Gene_Anno_dict[match_TransID.group('TransID')].strip()
                # # print(GeneName)
                attr=attr+"gene="+GeneName+";Name="+GeneName
                # # print(attr)
                New_Gff.write('\t'.join(line.split('\t')[0:8]) + '\t' + attr + '\n')
        elif catogr=="CDS":
            pattern_TransID=r'Parent=(?P<TransID>[^;\s]+)'
            match_TransID=re.search(pattern_TransID, attr)
            if match_TransID:
                GeneName=Gene_Anno_dict[match_TransID.group('TransID')].strip()
                attr=attr+";gene="+GeneName
                New_Gff.write('\t'.join(line.split('\t')[0:8]) + '\t' + attr + '\n')
        elif catogr=="five_prime_UTR":
            pattern_TransID=r'Parent=(?P<TransID>[^;\s]+)'
            match_TransID=re.search(pattern_TransID, attr)
            if match_TransID:
                GeneName=Gene_Anno_dict[match_TransID.group('TransID')].strip()
                attr=attr+";gene="+GeneName
                New_Gff.write('\t'.join(line.split('\t')[0:8]) + '\t' + attr + '\n')
        elif catogr=="three_prime_UTR":
            pattern_TransID=r'Parent=(?P<TransID>[^;\s]+)'
            match_TransID=re.search(pattern_TransID, attr)
            if match_TransID:
                GeneName=Gene_Anno_dict[match_TransID.group('TransID')].strip()
                attr=attr+";gene="+GeneName
                New_Gff.write('\t'.join(line.split('\t')[0:8]) + '\t' + attr + '\n')
        else:
            New_Gff.write(line)
Gff.close()
New_Gff.close()


