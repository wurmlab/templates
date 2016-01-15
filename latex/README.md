The template includes Makefile and other stuff required to compile LaTeX
projects.  To use it, copy all files from the respective journal's LaTeX
template to this directory:
```
cp ~/Downloads/plos-latex-template/* .
```

Rename the tex file from the journal to `project.tex`.
```
cp plos_latex_template.tex project.tex
```

Make changes to `project.tex`. To compile to PDF:
```
make project
```
