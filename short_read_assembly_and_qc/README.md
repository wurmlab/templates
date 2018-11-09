Author: Anurag Priyam
Date:  Friday, 9th November 2018

## Based on MSc 2018 coursework

Input: pool of 7 cleaned _Bombus lapidarius_ samples (9-11x)

### Run SPADES

```
# srm1

module load singularity

singularity run /data/containers/spades/spades-3.12.0.simg --only-assembler \
  -t 36 -m 740 --tmp-dir ${TMPDIR} -o tmp -k 33,55,77,101 -1 input/R1.fastq \
  -2 input/R2.fastq

cp tmp/{contigs,scaffolds}.fasta .
pigz --best -p 12 {contigs,scaffolds}.fasta
```

### Check N50, etc.
```
module load quast/4.6.1

quast.py --fast --no-check -m 0 -o tmp/quast_ctg contigs.fasta.gz
quast.py --fast --no-check -m 0 -o tmp/quast_scf scaffolds.fasta.gz
quast.py --fast --no-check -m 1000 -o tmp/quast_scf_1kb scaffolds.fasta.gz
```

Largest scaffold:  2.3 Mb

#### All contigs
Assembly length:      239 Mb
N50 length:           275 kb
Ns per 100 kb:        0.04

#### All scaffolds
Number of scaffolds:  23,329
Assembly length:      239 Mb
N50 length:           284 Kb
Ns per 100 kb:        1.74

#### Scaffolds longer than 1 kb
Number of scaffolds:   3,901
Assembly length:      235 Mb
N50 length:           290 Kb
Ns per 100 kb:        1.40


`scaffolds.fasta.gz` is the final assembly

### Check gene completeness of scaffolds

```
module load busco/3.0

# Copy over Augustus config files to our tmp folder as per:
# https://docs.hpc.qmul.ac.uk/apps/bio/busco/
cp -r /share/apps/sbcs/augustus/3.2.2/config tmp/augustus_3.2.2_config

# Tell Augustus (invoked by BUSCO) where it can find its configuration files.
export AUGUSTUS_CONFIG_PATH=tmp/augustus_3.2.2_config

# Finally, run BUSCO.
BUSCO.py -c 32 --blast_single_core -m geno -i scaffolds.fasta -o scf \
  -l /data/SBCS-WurmLab/archive/db/other/busco-lineages-v2-odb9/insecta_odb9

# Rename output dir.
mv tmp/run_scf tmp/busco_insecta
```

C:99.6%[S:99.5%,D:0.1%],F:0.2%,M:0.2%,n:1658

### Archive

```
rm tmp/{contigs,scaffolds}.fasta
tar cvzf tmp.tar.gz tmp
```
