#需要自己制作好基因的起始终止坐标文件，这样就可以找到自己的基因的位置，比如我的H3F3A是chr1:226249552-226259702，
#用bcftoolls简单的call variation即可，得到的vcf文件用annovar注释一下，看看是否在自己设计的蛋白质的某个位点的氨基酸

grep H3F3A ~/reference/gtf/gencode/protein_coding.hg19.position
samtools mpileup -r chr1:226249552-226259702  -ugf ~/reference/genome/hg19/hg19.fa *sorted.bam | bcftools call -vmO z -o H3F3A.vcf.gz
gunzip H3F3A.vcf.gz
~/biosoft/ANNOVAR/annovar/convert2annovar.pl -format vcf4old H3F3A.vcf >H3F3A.annovar
~/biosoft/ANNOVAR/annovar/annotate_variation.pl -buildver hg19 –geneanno –outfile H3F3A.anno H3F3A.annovar ~/biosoft/ANNOVAR/annovar/humandb/
~/biosoft/ANNOVAR/annovar/annotate_variation.pl -buildver hg19 –dbtype knownGene –geneanno –outfile H3F3A.anno H3F3A.annovar ~/biosoft/ANNOVAR/annovar/humandb/