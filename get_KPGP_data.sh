# ftp://ftp.kobic.re.kr/pub/KPGP/2015_release_candidate/WGS/KPGP-00001/
DIR=/media/wilson/b776f228-366c-4e52-acd6-65df5b458e8c/Project_Genomes
cd $DIR
mkdir KPGP-00001 && cd KPGP-00001
nohup wget  -c -r -nd -np -k -L -p  ftp://ftp.kobic.re.kr/pub/KPGP/2015_release_candidate/WGS/KPGP-00001 1>/dev/null  2>&1 
