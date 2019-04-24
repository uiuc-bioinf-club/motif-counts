

score_files_directory="motif_search"

windows_fasta_file=$1
windows_peak_file=$2

if [ ! -d $score_files_directory ]; then
    mkdir $score_files_directory
fi

cd $score_files_directory

../getMotifs $windows_fasta_file 1.0

for file in ./*
do
    python ./scoretocoverage.py $file
done

mkdir coverage
mv ./*.coverage ./coverage/

rm *.score

cd coverage
ls *.coverage > names
paste -d ',' *.coverage > coverage_data.csv
rm *.coverage

