#!/bin/sh
#PBS -l nodes=1:ppn=2
#PBS -l walltime=72:00:00
#PBS -l mem=64GB
#PBS -N anno
#PBS -d /public/workspace/319*******bit/DST2/1/Hep3B2-1-7_FRAS190069749-1a/hisat/variants
#PBS -o anno.out
#PBS -e anno.err

bytlib load annovar

convert2annovar.pl -format vcf4 ./all_selected2.vcf > real.avinput

table_annovar.pl ./real.avinput humandb/ -buildver hg38 -out Annotated -remove -protocol refGene,cytoBand,1000g2015aug_all,1000g2015aug_afr,1000g2015aug_amr,1000g2015aug_eas,1000g2015aug_eur,1000g2015aug_sas,exac03,avsnp150,esp6500siv2_all,esp6500siv2_ea,esp6500siv2_aa,gnomad_exome,dbnsfp35a,gnomad_genome,clinvar_20180603,cosmic70,icgc28,intervar_20180118 -operation g,r,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f  -argument '-hgvs',,,,,,,,,,,,,,,,,,, -nastring .