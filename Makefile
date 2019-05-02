default: pdf

# Constants.
rootname = thesis
rootfile = $(rootname).tex
outdir = build
outfile = $(outdir)/$(rootname).pdf

# Compression with ghostscript.
compress = gs -sDEVICE=pdfwrite -dPDFSETTINGS=/$(1) -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$(outdir)/$(rootname)-$(1).pdf $(outfile)

# Latex command to build pdf file.
latexmk = export TEXINPUTS=.:./tlsflyleaf/: && latexmk -pdf -quiet -f -pdflatex="pdflatex -interaction=nonstopmode" -outdir=$(outdir) $(1) $(rootfile)

# Build PDF version adapted to printers.
printer: pdf
	$(call compress,printer)

# Build PDF version adapted to screens.
screen: pdf
	$(call compress,screen)

# Build PDF version of the thesis manuscript.
pdf: $(rootfile)
	$(call latexmk)

# Watch and automatically recompile when a file changes.
watch: $(rootfile)
	$(call latexmk,-pvc -view=none)

# Remove intermediate build artifacts.
clean:
	latexmk -c -outdir=$(outdir) $(rootfile)

# Remove all build artifacts.
clean-all:
	rm -rf $(outdir)

# Phony targets will always trigger a re-run.
.PHONY: clean-all clean watch pdf
