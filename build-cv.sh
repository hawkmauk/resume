#!/bin/bash
set -e

# Run a verbose build to diagnose the issue
cd src/tex
latexmk -c -verbose main.tex
latexmk -pdf -verbose main.tex
cd ../../

# Move the resulting PDF to the output directory
mkdir -p docs/pdf
mv src/tex/main.pdf docs/pdf/mhawkins-cv.pdf