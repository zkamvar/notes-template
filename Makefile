TARGETS  := $(wildcard *.md)
HTML     := $(patsubst %.md,html/%.html,$(TARGETS))
PDF      := $(patsubst %.md,pdf/%.pdf,$(TARGETS))
DOCX     := $(patsubst %.md,docx/%.docx,$(TARGETS))
TEMPLATE := Helvetica-Garamond.docx

.PHONY: all
all : $(HTML) $(PDF) $(DOCX)

pdf html docx :
	mkdir -p $@

html/%.html : %.md pandoc.css | html
	pandoc --to html \
       --from markdown \
       --css pandoc.css \
       --output $@ $<

pdf/%.pdf : %.md pandoc.css | pdf
	pandoc --to latex \
       --latex-engine=xelatex \
       --from markdown \
       --css pandoc.css \
       --output $@ $<

docx/%.docx : %.md $(TEMPLATE) | docx
	pandoc --to docx \
       --reference-docx=$(TEMPLATE) \
       --from markdown \
       --output $@ $<

.PHONY: clean
clean:
	$(RM) -r html \
         pdf \
         docx
