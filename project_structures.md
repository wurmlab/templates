Conventions for project hierarchies
=====

Conventions: 
* key directory names begin with YYYY-MM-DD date, followed by camelCase or_underscore_delimited description
* a new project starting today should begin as follows: 
  2016-04-



### Example: 
```
2016-04-14-my_exciting_project
├── data
│   └── 2016-04-14-Bombus_raw_28_samples
│       ├──                                        # links to /data/SBCS-WurmLab/archive/db/genomic/...                 
│       ├──                                        # other real files
│       └── WHATIDID.txt  # list of ln -s or cp commands or human-readable instructions 
├── results
│   ├── 2016-04-14-scaffolding-based-approach
│   │   ├── WHATIDID.txt                           # or getResults.rb or knitR or jupyter notebook...
│   │   ├── input      -> ../../data/2016-04-14-first_attempt
│   │   ├── sratoolkit -> ../../soft/sratoolkit-2.4.2
│   │   ├── results                                # should have only few files here
│   │   └── tmp                                    # obviously use real scratch dir if more appropriate
│   └── WHATIDID.txt                               # for rationale or if multiple results directories
└── soft
    ├── sratoolkit-2.4.2 -> /data/SBCS-WurmLab/software/sratoolkit-2.4.2/
    └── # links to other software
```

### Credit: 
This was derived from [A Quick Guide to Organizing Computational Biology Projects](http://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000424)



