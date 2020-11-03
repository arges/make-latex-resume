all: resume.pdf

resume.pdf: resume.tex
	docker build . --tag resume
	docker create -ti --name output resume bash
	docker cp output:/resume.pdf resume.pdf
	docker rm -f output

clean:
	rm -f resume.pdf
