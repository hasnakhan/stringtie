#!/bin/bash

for file in /mnt/c/Users/hasna/Documents/MSc_project/hisat2/bamfiles_nov2021/*.bam; do 
name="$(basename $file | grep -P -o '^.?[^_]+')"
echo $name
stringtie -o all_out/$name/stfinal.gtf -A all_out/$name/abundance.tab -p 3 -a 20 -e -B -G all_merged_stringtie.gtf $file
done 