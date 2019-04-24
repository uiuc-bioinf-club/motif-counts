module load Python/3.6.1-IGB-gcc-4.9.4

peakfile=$1
genome_fasta=$2

./make_jun_fasta.sh $peakfile temp_fasta $genome_fasta

../find_motifs.sh ../temp_fasta $peakfile

rm temp_fasta
