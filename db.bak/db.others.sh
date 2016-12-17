mkdir -p db.UK10K
cd db.UK10KUK10K

## http://www.uk10k.org/
nohup wget ftp://ngs.sanger.ac.uk/production/uk10k/UK10K_COHORT/REL-2012-06-02/UK10K_COHORT.20160215.sites.vcf.gz &


mkdir -p db.gonl
cd db.gonl

## http://www.nlgenome.nl/search/
## https://molgenis26.target.rug.nl/downloads/gonl_public/variants/release5/
nohup wget  -c -r -nd -np -k -L -p https://molgenis26.target.rug.nl/downloads/gonl_public/variants/release5  &


## 1 million single nucleotide polymorphisms (SNPs) for DNA samples from each of the three ethnic groups in Singapore – Chinese, Malays and Indians.
## The Affymetrix Genome-Wide Human SNP Array 6.0 && The Illumina Human1M single BeadChip
## http://www.statgen.nus.edu.sg/~SGVP/

## http://www.statgen.nus.edu.sg/~SGVP/singhap/files-website/samples-information.txt

# http://www.statgen.nus.edu.sg/~SGVP/singhap/files-website/genotypes/2009-01-30/QC/


## Singapore Sequencing Malay Project (SSMP)

mkdir -p db.SSMP
cd db.SSMP

## http://www.statgen.nus.edu.sg/~SSMP/
## http://www.statgen.nus.edu.sg/~SSMP/download/vcf/2012_05
## Singapore Sequencing Indian Project (SSIP)


mkdir -p db.SSIP
cd db.SSIP

# http://www.statgen.nus.edu.sg/~SSIP/
## http://www.statgen.nus.edu.sg/~SSIP/download/vcf/dataFreeze_Feb2013