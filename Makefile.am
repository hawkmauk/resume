# You can set these variables from the command line, and also
# from the environment for the first two.
HTMLBUILD     ?= htlatex
PDFBUILD      ?= pdflatex

# Top level directories
SOURCEDIR     = $(top_srcdir)/src/tex
INCLUDEDIR    = $(top_srcdir)/include
BUILDDIR      = $(top_srcdir)/build
DISTDIR       = $(top_srcdir)/docs

# Config directories
HTMLCONFIG    = $(INCLUDEDIR)/html
PDFCONFIG     = $(INCLUDEDIR)/pdf

PDFDIR        = $(DISTDIR)/pdf
HTMLDIR       = $(DISTDIR)

# Documents to publish
# 001-mhawkins-cv : Development focused CV
# 002-mhawkins-cv : Management focused CV
DOCUMENTS     = 001-mhawkins-cv 002-mhawkins-cv
PDFDOCUMENTS  = $(foreach doc,$(DOCUMENTS),$(doc).pdf)
HTMLDOCUMENTS = $(foreach doc,$(DOCUMENTS),$(doc).html)

# include the following paths for the tex processor
# $(PDFCONFIG)/packages
# $(PDFCONFIG)/snippets
# $(PDFCONFIG)/images
# src/drs
COMMONINPUTS=$(TEXINPUTS):$(SOURCEDIR)/
PDFINPUTS=$(COMMONINPUTS):$(PDFCONFIG)/
HTMLINPUTS=$(COMMONINPUTS):$(HTMLCONFIG)/

# set the output directory
PDFOPTS       ?= --output-directory=$(PDFDIR) #--interaction=batchmode

# tex4ht has default config options for html, xhtml etc or you can define your
# own config file which is what we have here
TEX4HTSTYOPTS  ?= "$(HTMLCONFIG)/tex4ht.cfg,tidy,-css"
# tex4ht options
TEX4HTOPTS   ?= ""
# t4ht options
T4HTOPTS   ?= "-d$(HTMLDIR)/"
# latex options
LATEXOPTS ?= ""
HTMLOPTS      ?= $(TEX4HTSTYOPTS) $(TEX4HTOPTS) $(T4HTOPTS) $(LATEXOPTS)

CLEANFILES := $(foreach doc,$(DOCUMENTS),$(doc).log) \
	$(foreach doc,$(DOCUMENTS),$(doc).4ct) \
	$(foreach doc,$(DOCUMENTS),$(doc).4tc) \
	$(foreach doc,$(DOCUMENTS),$(doc).aux) \
	$(foreach doc,$(DOCUMENTS),$(doc).css) \
	$(foreach doc,$(DOCUMENTS),$(doc).dvi) \
	$(foreach doc,$(DOCUMENTS),$(doc).html) \
	$(foreach doc,$(DOCUMENTS),$(doc).idv) \
	$(foreach doc,$(DOCUMENTS),$(doc).lg) \
	$(foreach doc,$(DOCUMENTS),$(doc).tmp) \
	$(foreach doc,$(DOCUMENTS),$(doc).xref) \
	$(foreach doc,$(DOCUMENTS),$(PDFDIR)/$(doc).aux) \
	$(foreach doc,$(DOCUMENTS),$(PDFDIR)/$(doc).log) \
	$(foreach doc,$(DOCUMENTS),$(PDFDIR)/$(doc).toc) \
	$(foreach doc,$(DOCUMENTS),$(PDFDIR)/$(doc).out)

SUFFIXES = .tex .pdf

PDFSRC := main.tex
HTMLSRC := main-html.tex

# Several make rules to generate the PDF from the LaTeX source
$(PDFDOCUMENTS):
	@echo documents $(DOCUMENTS)
	$(eval PDFOPTS += --jobname="$(basename $@)")
	@echo === Making PDF: $@ from $^ ===
	$(MKDIR_P) $(PDFDIR)
	TEXINPUTS=$(PDFINPUTS) $(PDFBUILD) $(PDFOPTS) $(PDFSRC)
	@while ( grep "Rerun to " $(MANNAME).log  ); do           \
        echo '** Re-running LaTeX **';      \
		TEXINPUTS=$(PDFINPUTS) $(PDFBUILD) $(PDFOPTS) $(PDFSRC); \
    done 
	if [ -f $(MANNAME).idx ]; then \
        echo === Making index ===; \
        makeindex $(MANNAME); \
    fi
	@echo === Making final PDF ===
	TEXINPUTS=$(PDFINPUTS) $(PDFBUILD) $(PDFOPTS) $(PDFSRC)

# The name of the input file must be changed to change the jobname so
$(HTMLDOCUMENTS): clean
	@echo === Making HTML ===
	$(MKDIR_P) $(HTMLDIR)
	cp -r $(HTMLCONFIG)/{css,img,js} $(HTMLDIR)/
	ln -f -s $(SOURCEDIR)/$(HTMLSRC) $(basename $@).tex
	TEXINPUTS=$(HTMLINPUTS) $(HTMLBUILD) $(basename $@).tex $(HTMLOPTS)

.tex.aux:
	@echo === Making $@ file from $^ ===
	$(MKDIR_P) $(PDFDIR)
	TEXINPUTS=$(PDFINPUTS) $(PDFBUILD) $(PDFOPTS) $(HTMLSRC)

# A target needed to keep track of the nr. of LaTeX runs
.btmp:

pdf: $(PDFDOCUMENTS)

html: $(HTMLDOCUMENTS)

all: pdf html

