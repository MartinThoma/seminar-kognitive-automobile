DOKUMENT = booka4

make:
	pdflatex $(DOKUMENT).tex -output-format=pdf # Referenzen erstellen
	bibtex $(DOKUMENT)
	pdflatex $(DOKUMENT).tex -output-format=pdf # Referenzen einbinden
	pdflatex $(DOKUMENT).tex -output-format=pdf # Referenzen einbinden
	make clean

ebook:
	latexml --dest=$(DOKUMENT).xml $(DOKUMENT).tex
	latexmlpost -dest=$(DOKUMENT).html $(DOKUMENT).xml
	ebook-convert $(DOKUMENT).html $(DOKUMENT).epub --language de --no-default-epub-cover

clean:
	rm -rf  $(TARGET) *.class *.html *.log *.aux *.out *.thm *.idx *.toc *.ind *.ilg *.glg *.glo *.gls *.ist *.xdy *.bbl *.blg *.bak *.lof *.lot *.tcp *.tdo *.tps
	find . -name "*.aux" -type f -delete
