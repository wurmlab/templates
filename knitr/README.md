# Markdown-based

In R: 

    library(knitr)
    knit('minimal.Rmd')


Then in shell use use standard markdown to pdf converter - e.g. 

    markdown-pdf minimal.md 
    open minimal.pdf

or  

    pandoc minimal.md -o minimal.pdf -V geometry:margin=2cm
    open minimal.pdf


# Tex-based

In R:

    library(knitr)
    knit("MyAnalysis.Rnw")   

Then (need `pdflatex` twice if table of contents):

    pdflatex MyAnalysis.tex ; pdflatex MyAnalysis.tex
    open MyAnalysis.pdf

