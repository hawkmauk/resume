Resume-LaTeX
============

Resume written in latex in order to demonstrate publishing to multiple formats and tailored for different applications, with correct emphasis on relevant skills.

PDF
Two PDF are generated in the docs/pdf folder.
001-mhawkins-cv.pdf focuses on leadership skills and is geared towards management
positions
002-mhawkins-cv.pdf is developer centric and highlights programming experience

Web Deployments
[Developer](https://hawkmauk.github.io/resume/001-mhawkins-cv.html) focused
and [Leadership](https://hawkmauk.github.io/resume/002-mhawkins-cv.html) resume
can be found on github-pages.

## Build (Ubuntu)

Install dependencies
```[sh]
sudo apt update
sudo apt upgrade
sudo apt install build-essential autotools-dev automake texlive-latex-extra
```

Build the project
```[sh]
./autogen.sh
mkdir "build" && cd "$_"
../configure
make
```
