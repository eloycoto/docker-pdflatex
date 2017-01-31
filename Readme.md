# Docker PDF-Latex


Docker image that contains the latest
[tlmgr](https://www.tug.org/texlive/tlmgr.html) and can create PDF from tex
files:

To run, with the following command:

```
    docker run --rm -v $(pwd):/output eloycoto/pdflatex example.tex
```
