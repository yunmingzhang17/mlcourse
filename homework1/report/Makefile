
all:tex



tex:
	latex main.tex
	dvips -t letter -f main.dvi > main.ps
	ps2pdf main.ps

clean:
	rm -rfv *.aux *.toc *.lo* *.idx *.bbl *.blg *.dvi *.pdf *.tmp *.ps *~