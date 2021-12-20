#!/bin/bash

for file in /mnt/c/Users/hasna/Documents/MSc_project/stringtie/bams_subset/*.bam; do 
name=$(basename "$file")
echo $name
stringtie -o test_out/$name/stfinal.gtf -A test_out/$name/abundance.tab -p 3 -a 20 -e -B -G stringtie_merged.gtf  $file
done 