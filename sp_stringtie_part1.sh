#!/bin/bash
#as with everything starting with sp_, this is the first script in the stringtie re-run attmept. In addition to setting the anchor length at 20nt, we're increasing the minimum junction read coverage to 2 (up from 1) and the minimum isoform fractions (as a fraction of the most expressed isoform) to 0.1 (up from 0.01). Not sure of these changes actually need to be made in step 1 or step 3, so I'll make them in both 

for file in /mnt/c/Users/hasna/Documents/MSc_project/hisat2/bamfiles_nov2021/*.bam; do 
name="$(basename $file | grep -P -o '^.?[^_]+')"
echo $name
stringtie -o sp_all_gtfs/$name"_stringtie.gtf" -p 3 -a 20 -f 0.1 -c 2 -j 2 -G all_done_tidy.gtf $file
done 