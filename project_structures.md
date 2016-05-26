Conventions for project hierarchies
=====

Conventions: 
* key directory names begin with YYYY-MM-DD date, followed by camelCase or_underscore_delimited description
* a new project starting today should begin as follows: 
  2016-04-



### Example: 
```
2016-04-14-bombus_variant_calling
├── data
│   └── 2016-04-14-bombus_raw_28_samples
│   │   ├──                                        # links to /data/SBCS-WurmLab/archive/db/genomic/...                 
│   │   ├──                                        # other real files
│   │   └── WHATIDID.txt  # list of ln -s or cp commands or human-readable instructions 
│   └── 2016-04-16-cleaned_reads
│       ├── sample1.fq.gz   -> ../../results/2016-04-14-read_cleaning/results/sample1.clean.fq.gz
│       ├── sample2.fq.gz   -> ../../results/2016-04-14-read_cleaning/results/sample2.clean.fq.gz
│       └── sample3.fq.gz   -> ../../results/2016-04-14-read_cleaning/results/sample3.clean.fq.gz
├── results
│   ├── 2016-04-14-read_cleaning
│   │   ├── input        -> ../../data/2016-04-14-first_attempt
│   │   ├── results                                # only few files here
│   │   ├── sratoolkit   -> ../../soft/sratoolkit-2.4.2
│   │   ├── tmp                                    # use real scratch dir if more appropriate
│   │   └── WHATIDID.txt                           # or equivalent (knitr/jupyter)
│   ├── 2016-04-16-mapping_to_reference
│   │   ├── input        -> ../../data/2016-04-16-cleaned_reads
│   │   ├── sratoolkit   -> ../../soft/sratoolkit-2.4.2
│   │   ├── results                                # only few files here
│   │   ├── tmp                                    # use real scratch dir if more appropriate
│   │   └── WHATIDID.txt                           # or equivalent (knitr/jupyter)
│   └── WHATIDID.txt                               # for rationale or if multiple results directories
└── soft
    ├── sratoolkit-2.4.2                           # if installed locally
    ├── bwa              -> /share/apps/sbcs/bwa/0.6.2/bin/bwa
    └── # links to other software if needed
```

### Credit: 
This was derived from [A Quick Guide to Organizing Computational Biology Projects](http://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000424) with input (a while ago) from others including Julien Roux.



