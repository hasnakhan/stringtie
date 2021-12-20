#!/bin/bash

for file in /mnt/c/Users/hasna/Documents/MSc_project/hisat2/bamfiles_nov2021/*.bam; do 
name="$(basename $file | grep -P -o '^.?[^_]+')"
echo $name
stringtie -o sp_all_out/$name/stfinal.gtf -A sp_all_out/$name/abundance.tab -p 3 -a 20 -f 0.1 -c 2 -j 2 -e -B -G sp_all_merged_stringtie.gtf $file
done 