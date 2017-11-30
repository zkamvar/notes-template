# notes-template

A template for notes written in markdown and rendered to html, pdf, and docx with pandoc

To use this, you should have pandoc 1.19 or greater and Make installed

## Download

To copy this into your current directory with markdown notes:

```bash
curl -L https://api.github.com/repos/zkamvar/notes-template/tarball \
| tar --strip-components=1 -xzv \
--exclude=README.md \
--exclude=LICENSE
```
```
% Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                               Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100 66477    0 66477    0     0   120k      0 --:--:-- --:--:-- --:--:--  120k
x .gitignore
x Helvetica-Garamond.docx
x Makefile
x flow.png
x pandoc.css
```

> The above command will not copy the README.md or LICENSE files to prevent them
> over-writing your files.

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
