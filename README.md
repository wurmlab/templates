Templates
---------

Project directory structure
===========================
See [project_structures.md](project_structures.md)

Building command line application using Ruby
============================================

Clone this repository.

    $ git clone https://github.com/wurmlab/templates.git

Alternatively, you can download zip archive by clicking on the 'Download ZIP'
button on the right.

Then `cd` to directory where you want to create your app and run the `rbgen`
command included in this repository.

    $ path/to/templates/rbgen app_name

For example: `~/gitstuff/templates/rbgen transcript_analyser`

This generates a sample Ruby app that given a list of sequence ids in a text
file will download corresponding sequences in FASTA format. More information
on how to use and edit the sample app to your requirements can be found in
the README.md file of the generated sample app.
