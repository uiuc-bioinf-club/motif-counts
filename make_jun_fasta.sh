peakfile=$1
outfilename=$2
genome_fasta_file=$3

bedtools getfasta -fi $genome_fasta_file -bed $peakfile -fo temp

awk '{gsub(/:/, " "); gsub(/-/, " "); print}' temp > $outfilename

rm temp
