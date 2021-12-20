#!/bin/bash

for file in /mnt/c/Users/hasna/Documents/MSc_project/stringtie/bams_subset/*.bam; do 
name=$(basename "$file")
echo $name
stringtie -o $name"_stringtie_gtf.gtf" -p 3 -a 20 -G all_done_tidy.gtf  $file
done 