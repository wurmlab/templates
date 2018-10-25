# Conventions for organising sequenced reads

Shared data, such as sequenced reads should be put in
`/data/archive/archive-SBCS-WurmLab/db` (a.k.a db).

## Genomic reads

Reads from whole genome sequencing should be placed in
`genomic/reads/Species_name` in db.

```
Pheidole_pallidula
└── 2018-05-19-Ppal_illumina_hiseq4000_3lanes
    ├── lane_1
    |   ├── FASTQ_file_1_from_sequencing_center
    |   ├── FASTQ_file_2_from_sequencing_center
    |   └── ...
    ├── lane_2
    |   ├── FASTQ_file_1_from_sequencing_center
    |   ├── FASTQ_file_2_from_sequencing_center
    |   └── ...
    ├── lane_3
    |   ├── FASTQ_file_1_from_sequencing_center
    |   ├── FASTQ_file_2_from_sequencing_center
    |   └── ...
    |── WHATIDID.txt # how was the DNA extracted, etc.
    |── renamed # friendlier names
    |   ├── lane_1
    |   |   ├── sample1.R1.fastq.gz   -> ../lane_1/FASTQ_file_1_from_sequencing_center
    |   |   ├── sample1.R2.fastq.gz   -> ../lane_1/FASTQ_file_2_from_sequencing_center
    |   |   └── ...
    |   ├── lane_2
    |   |   ├── sample1.R1.fastq.gz   -> ../lane_2/FASTQ_file_1_from_sequencing_center
    |   |   ├── sample1.R2.fastq.gz   -> ../lane_2/FASTQ_file_2_from_sequencing_center
    |   |   └── ...
    |   ├── lane_3
    |   |   ├── sample1.R1.fastq.gz   -> ../lane_3/FASTQ_file_1_from_sequencing_center
    |   |   ├── sample1.R2.fastq.gz   -> ../lane_3/FASTQ_file_2_from_sequencing_center
    |   |   └── ...
    |   └── WHATIDID.txt # how were the links generated
    └── cleaned
        └── 2018-10-19-Ppal_reads_qc_for_asm
            ├── sample1.R1.fastq.gz
            ├── sample1.R2.fastq.gz
            ├── ...
            └── WHATIDID.txt # how were the reads cleaned, which samples, etc.
```

Conventions include:
* One directory per run of the sequencing machine
* Directory names begin with YYYY-MM-DD date, followed by _underscore_
  delimited description
* Description should include at least three pieces of information:
  * 4 letter abbreviation for species
  * sequencing platform
  * number of lanes
* What should the main WHATIDID.txt file contain? Consider the following two
  examples:
  * /data/SBCS-WurmLab/archive/db/genomic/reads/Bombus_terrestris/SAMPLE_Information_Bter_batch_two_runs.txt
  * /data/archive/archive-SBCS-WurmLab/db/genomic/reads/Pheidole_pallidula/2018-05-Pheidole-115workers-illumina-3lanes/Pheidole-pallidula_2018-05_genewiz_hiseq4000_3lanes_sample-info.txt
