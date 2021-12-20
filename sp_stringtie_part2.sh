#!/bin/bash
#changes from last time: minimum transcript read coverage is up to 2 (from 0, no idea why this is the default), minimum transcript TPM is up to 1 (from 0) and minimum isoform fraction (as a fraction of most abundant isoform) is up to 0.1

stringtie --merge -o sp_all_merged_stringtie.gtf -G all_done_tidy.gtf -i -c 2 -T 1 -f 0.1 sp_all_gtfs/*.gtf