all: test

test:
	@gst -f example.st

install: package.xml QuickSmash.st example.st
	@gst-package -t ~/.st package.xml

uninstall:
	-gst-package -t ~/.st package.xml

editorconfig:
	@git ls-files -z | grep -av patch | xargs -0 -r -n 100 $(shell npm bin)/eclint check

lint: editorconfig
