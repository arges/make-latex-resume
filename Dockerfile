FROM ubuntu:20.04 as render

ENV TZ=America/Chicago
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt -yqq update && apt -yqq install texlive-xetex texlive-latex-recommended tex-gyre
ADD resume.tex /resume.tex
ADD resume.cls /resume.cls
RUN xelatex /resume.tex

FROM scratch
COPY --from=render /resume.pdf /resume.pdf
