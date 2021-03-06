#!/bin/bash

# Linhua Sun
# Batch run the shortshack
# Wed Jul 20 11:22:39 EDT 2016
# change the loci. Steps = 200bp
# array: http://c.biancheng.net/cpp/view/7002.html


OUTDIR="RAW-READS_SHORT_STARK_RESULTS"
REFGENOME="/sdd1/users/linhua/QIAN_LAB/ATH_SHORTSTARK/Athaliana_167.fa"
DATA=($(find ./RAW-DATA-2016-07-19/ -name "*.gz"))

if [ ! -d ${OUTDIR} ]
              then mkdir -p ${OUTDIR}
fi

for i in {0..3}
do
       ID=$(basename ${DATA[i]} _R1.fq.gz)
       echo "Sample ID is ${ID}."
       echo "Value i=${i}."
       New_ShortStack --bowtie_cores 10 --sort_mem 10G --outdir ${OUTDIR}/${ID}_OUTPUT --readfile ${DATA[i]}  --genomefile ${REFGENOME} --locifile split_TAIR10_steps_200_loci.txt
done

