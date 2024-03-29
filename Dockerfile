FROM ubuntu:22.04
MAINTAINER Eloy  Coto <eloycoto@acalustra.com>

RUN apt-get update
RUN apt-get install -y build-essential wget

RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz; \
	mkdir /install-tl-unx; \
	tar -xvf install-tl-unx.tar.gz -C /install-tl-unx --strip-components=1

RUN echo "selected_scheme scheme-basic" >> /install-tl-unx/texlive.profile; \
	/install-tl-unx/install-tl -profile /install-tl-unx/texlive.profile

RUN rm -r /install-tl-unx; \
	rm install-tl-unx.tar.gz

ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/texlive/2022/bin/x86_64-linux/
RUN tlmgr install latexmk extsizes fontawesome5 academicons xcolor pgf ms tcolorbox \
                  environ trimspaces etoolbox enumitem dashrule ifmtarg multirow \
                  changepage biblatex logreq xstring lato ec slantsc moderncv arydshln datetime fmtcount
RUN tlmgr install xkeyval cm-super
VOLUME ["/output"]
WORKDIR /output
ENTRYPOINT ["pdflatex", "-output-dir=/output"]
