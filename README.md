# notes-template

A template for notes written in markdown and rendered to html, pdf, and docx with pandoc

To use this, you should have pandoc 1.19 or greater and Make installed

## Download

```
git clone https://github.com/zkamvar/notes-template.git
cd notes-template
```
## Run

To run this, first add any markdown notes you want and then run:

```
make clean
make
```

The workflow without any external input is:

![Workflow in makefile](flow.png)

## Files

 - [Makefile](Makefile) will find all `*.md` files and render them to HTML, PDF, and DOCX
 - Helvetica-Garamond.docx this is a docx template for pandoc
 - [pandoc.css](pandoc.css) this file is from https://gist.github.com/killercup/5917178/

 ```
 curl -O https://gist.githubusercontent.com/killercup/5917178/raw/40840de5352083adb2693dc742e9f75dbb18650f/pandoc.css
 ```
