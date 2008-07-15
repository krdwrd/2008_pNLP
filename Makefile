TEXFILES = manual.tex 20080703_presentation.tex 20080522_presentation.tex 
PDFFILES = manual.pdf 20080703_presentation.pdf 20080522_presentation.pdf 

default: pdf

pdf: report.tex
	pdflatex report 

rubber: $(TEXFILES)
	rubber -d $(TEXFILES)
	rubber --clean $(TEXFILES)

rubber-clean:
	rubber --clean -d $(TEXFILES)

clean:
	rm -rf *.pdf *.log *.aux *.out
