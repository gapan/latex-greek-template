
all: pdf clean-tmp

pdf:
	xelatex main
	biber main
	xelatex main
	xelatex main
	mv main.pdf output.pdf

docx:
	latexpand main.tex > docx.tex
	pandoc -f latex -t docx -o output.docx docx.tex
	rm -f docx.tex

odt:
	latexpand main.tex > odt.tex
	pandoc -f latex -t odt -o output.odt odt.tex
	rm -f odt.tex

clean: clean-tmp clean-log

clean-log:
	rm -f *.log

clean-tmp:
	@rm -f *.aux
	@rm -f *.bbl
	@rm -f *.bcf
	@rm -f *.blg
	@rm -f *.xml
	@rm -f *.toc

.PHONY: all pdf clean-tmp clean-log odt docx

