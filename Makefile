PDF_TARGETS = report.pdf 20080703_presentation.pdf 20080522_presentation.pdf
TEX_SRCS := $(patsubst %pdf,%tex,$(PDF_TARGETS))
TEX_XTRA_SRCS :=
BIB_SRCS := $(wildcard *.bib)

TEX = pdflatex -file-line-error -interaction=errorstopmode
LATEXMK_CE_OPTS = '$$cleanup_includes_cusdep_generated=1; \
		$$clean_ext = "%R.snm %R.nav"; \
		$$clean_full_ext = $$clean_ext; '

.PHONY: all clean cleanall

all: $(PDF_TARGETS)

$(PDF_TARGETS): %.pdf:%.tex $(TEX_XTRA_SRCS) $(BIB_SRCS)
	latexmk -pdf -pdflatex="$(TEX)" -bibtex -use-make $<

clean:
	latexmk -c -bibtex -e $(LATEXMK_CE_OPTS)

cleanall:
	latexmk -C -bibtex -e $(LATEXMK_CE_OPTS)

