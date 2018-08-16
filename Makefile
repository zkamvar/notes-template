TARGETS  := $(wildcard *.md)
HTML     := $(patsubst %.md,html/%.html,$(TARGETS))
PDF      := $(patsubst %.md,pdf/%.pdf,$(TARGETS))
DOCX     := $(patsubst %.md,docx/%.docx,$(TARGETS))
TEMPLATE := Helvetica-Garamond.docx
ifeq ("$(shell pandoc --version | grep -c 'pandoc 2')","1")
	PANDARGS := --from markdown+smart --standalone -F pandoc-citeproc
	REFCMD := --reference-doc
	ENGINE   := --pdf-engine=xelatex
else
	PANDARGS := --from markdown --smart --standalone -F pandoc-citeproc
	REFCMD := --reference-docx
	ENGINE   := --latex-engine=xelatex
endif

.PHONY: all
all : $(HTML) $(PDF) $(DOCX)

pdf html docx :
	mkdir -p $@

html/pandoc.css : pandoc.css | html
	cp $< $@

html/%.html : %.md html/pandoc.css | html
	pandoc --to html \
       $(PANDARGS) \
       --css pandoc.css \
       --output $@ $<

pdf/%.pdf : %.md pandoc.css | pdf
	pandoc --to latex \
       $(ENGINE) \
       $(PANDARGS) \
       --css pandoc.css \
       --output $@ $<

docx/%.docx : %.md $(TEMPLATE) | docx
	pandoc --to docx \
       $(REFCMD)=$(TEMPLATE) \
       $(PANDARGS) \
       --output $@ $<

.PHONY: clean
clean:
	$(RM) -r html \
         pdf \
         docx
