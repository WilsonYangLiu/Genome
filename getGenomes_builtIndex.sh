DIR=/media/wilson/b776f228-366c-4e52-acd6-65df5b458e8c/Project_Genomes
# 下载hg19：
cd $DIR

mkdir -p genome/hg19 && cd genome/hg19

nohup wget http://hgdownload.cse.ucsc.edu/goldenPath/hg19/bigZips/chromFa.tar.gz 

tar zvfx chromFa.tar.gz

cat *.fa > hg19.fa

rm chr*.fa

# 下载hg38
cd $DIR

mkdir -p genome/hg38 && cd genome/hg38

nohup wget http://hgdownload.cse.ucsc.edu/goldenPath/hg38/bigZips/hg38.fa.gz 

gzip -d hg38.fa.gz 

#gzip -d hg38.fa.gz

# 下载的小鼠基因组
cd $DIR

mkdir -p genome/mm10 && cd genome/mm10

nohup wget http://hgdownload.cse.ucsc.edu/goldenPath/mm10/bigZips/chromFa.tar.gz 

tar zvfx chromFa.tar.gz

cat *.fa > mm10.fa

rm chr*.fa

# bowtie软件建立索引文件
cd $DIR

mkdir -p index/bowtie && cd index/bowtie

nohup time bowtie2-build $DIR/genome/hg19/hg19.fa $DIR/index/bowtie/hg19 1>hg19.bowtie_index.log 2>&1 

nohup time bowtie2-build $DIR/genome/hg38/hg38.fa $DIR/index/bowtie/hg38 1>hg38.bowtie_index.log 2>&1 

nohup time bowtie2-build $DIR/genome/mm10/mm10.fa $DIR/index/bowtie/mm10 1>mm10.bowtie_index.log 2>&1 

# bwa软件建立索引文件
cd $DIR

mkdir -p index/bwa && cd index/bwa

nohup time bwa index -a bwtsw -p $DIR/index/bwa/hg19 $DIR/genome/hg19/hg19.fa 1>hg19.bwa_index.log 2>&1 

nohup time bwa index -a bwtsw -p $DIR/index/bwa/hg38 $DIR/genome/hg38/hg38.fa 1>hg38.bwa_index.log 2>&1

nohup time bwa index -a bwtsw -p $DIR/index/bwa/mm10 $DIR/genome/mm10/mm10.fa 1>mm10.bwa_index.log 2>&1 

# hisat软件建立索引文件
cd $DIR

mkdir -p index/hisat && cd index/hisat

nohup wget ftp://ftp.ccb.jhu.edu/pub/infphilo/hisat2/data/hg19.tar.gz 

nohup wget ftp://ftp.ccb.jhu.edu/pub/infphilo/hisat2/data/hg38.tar.gz 

nohup wget ftp://ftp.ccb.jhu.edu/pub/infphilo/hisat2/data/grcm38.tar.gz 

tar zxvf hg19.tar.gz

tar zxvf grcm38.tar.gz

tar zxvf hg38.tar.gz