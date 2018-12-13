NAME=report


.PHONY: watch

${NAME}.pdf: ${NAME}.tex ${NAME}.aux IEEEtran.cls ${NAME}.bbl
	pdflatex $<

${NAME}.aux: ${NAME}.tex
	pdflatex $<

${NAME}.bbl: ${NAME}.aux ${NAME}.bib
	bibtex ${NAME}

watch: ${DEPS}
	ls ${DEPS} | entr make
