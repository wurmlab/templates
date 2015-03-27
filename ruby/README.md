Template for building command line application using Ruby
---------------------------------------------------------

Getting Started
===============

Get the template.

    $ git clone https://github.com/wurmlab/templates.git

`cd` to directory in which you want to create your app. Then generate application skeleton.

    $ path/to/templates/rbgen appname

For example: `~/gitstuff/templates/rbgen transcript_analyser`


Use.

    $ gem install bundler # first time
    $ bundle exec bin/appname

## Where to edit

* Specify input arguments (e.g., analysis parameters) in the `optspec` section of `bin/app`. E.g. modify (and duplicate or remove) the example  `opts.on('-n', '--name=NAME') {|o| options[:name] = o}`
* Do things (with input etc) between `def run` and `end` in `lib/app.rb`. Editing this method is sufficient for short scripts. For more involved analyses, additional methods can go in `lib/app.rb` or (if there is a case for broader re-use) in `lib/componentA.rb`.

## Additional info

This template automatically takes input files as here: `bundle exec bin/appname input1.fq input2.fq`.

Any string output like  `puts "ACAGTAGCAGTCAGC"` will display in standard output - thus output can be redirected with `>`. 
Errors (and logging info) should be displayed in standard error by `STDERR.puts "I did a great job.". 
