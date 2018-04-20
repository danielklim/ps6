RNWS = $(wildcard *.Rnw)
PDFS = $(RNWS:.Rnw=.pdf)
TEXS = $(RNWS:.Rnw=.tex)

TRASH_EXT = aux log toc snm nav vrb pdf tex out
TRASH = $(foreach ext, $(TRASH_EXT), $(RNWS:.Rnw=.$(ext)))

.PHONY: pdf tex clean

all: $(TEXS) $(PDFS)

pdf: $(PDFS)

tex: $(TEXS) 

%.tex: %.Rnw
	Rscript -e "Sweave('$<')"

%.pdf: %.tex 
	pdflatex --interaction=nonstopmode $<
	
clean:
	rm -rf $(TRASH)
	rm -rf *.pdf

