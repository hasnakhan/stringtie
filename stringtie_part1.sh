#!/bin/bash

for file in /mnt/c/Users/hasna/Documents/MSc_project/hisat2/bamfiles_nov2021/*.bam; do 
name="$(basename $file | grep -P -o '^.?[^_]+')"
echo $name
stringtie -o all_gtfs/$name"_stringtie.gtf" -p 3 -a 20 -G all_done_tidy.gtf  $file
done 