TEXFILES = report.tex 20080703_presentation.tex 20080522_presentation.tex 

default: rubber

rubber: $(TEXFILES)
	rubber -d $(TEXFILES)
	rubber --clean $(TEXFILES)

rubber-clean:
	rubber --clean -d $(TEXFILES)

clean: rubber-clean
	rm -f *.log *.aux *.out
