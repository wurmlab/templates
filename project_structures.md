Conventions for project hierarchies
=====

Best to just illustrate with an example.

## Example: 

```
2016-04-14-bombus_variant_calling
├── input
│   ├── 2016-04-14-bombus_raw_28_samples
│   │   ├── sample1.fq    #  could link to /data/SBCS-WurmLab/archive/db/genomic/reads/...                 
│   │   ├── sample2.fq 
│   │   ├── sample3.fq
│   │   ├── bombus_genome.fa -> ~/db/genomic/B_terrestris/Bter20110317-genome.fa
│   │   └── WHATIDID.txt  # list of ln -s, cp or wget/curl commands 
│   └── 2016-04-16-cleaned_reads
│       ├── sample1.fq.gz   -> ../../results/2016-04-14-read_cleaning/results/sample1.clean.fq.gz
│       ├── sample2.fq.gz   -> ../../results/2016-04-14-read_cleaning/results/sample2.clean.fq.gz
│       ├── sample3.fq.gz   -> ../../results/2016-04-14-read_cleaning/results/sample3.clean.fq.gz
│       └── WHATIDID.txt  # just the ln -s commands.
├── results
│   ├── 2016-04-14-read_cleaning
│   │   ├── input        -> ../../data/2016-04-14-bombus_raw_28_samples
│   │   ├── results                                # only few files here
│   │   ├── sratoolkit   -> ../../soft/sratoolkit-2.4.2/bin/
│   │   ├── tmp                                    # use real scratch dir if more appropriate
|   |   ├── ENVIRONMENT.sh                         # if any particular software, modules or containers need to be loaded
│   │   └── WHATIDID.txt                           # or equivalent .sh or .Rmd (or knitr/jupyter)
│   ├── 2016-04-16-mapping_to_reference
│   │   ├── input        -> ../../data/2016-04-16-cleaned_reads
│   │   ├── results                                # only few files here
│   │   ├── tmp                                    # use real scratch dir if more appropriate
|   |   ├── ENVIRONMENT.sh                         # if any particular software, modules or containers need to be loaded
│   │   └── WHATIDID.txt                           # or equivalent .sh or .Rmd (or knitr/jupyter)
│   └── WHATIDID.txt                               # for overall rationale
└── soft
    ├── sratoolkit-2.4.2                           # if installed locally
    ├── bwa              -> /share/apps/sbcs/bwa/0.6.2/bin/bwa
    └── # links to other software if needed
```


## Explicit (partial) conventions
Conventions include: 
* key directory names begin with YYYY-MM-DD date, followed by camelCase or_underscore_delimited description
  For example,  a new project starting today should begin as follows: 2016-04-24-a_self_explanatory_name.
* all subdirectory names should be self-explanatory
* link to files when appropriate. this can save tons of space AND reduce ambiguity/risks
* every `results` dir should contain a link to an `input` dir
* every directory in which you did something should contain a `WHATIDID.txt` (or an equivalent ruby/perl/jupyter/R/knitR script) that contains all relevant commands. required to get from `input` to `results`.
* once you have created an "input" (i.e. "data") folder, make it read-only because you don't want any accidental edits while you are running your analysis


## Credit: 
This was derived from [A Quick Guide to Organizing Computational Biology Projects](http://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000424) with input (a while ago) from others including Julien Roux.



