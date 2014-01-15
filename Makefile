all: test

test:
	gst -f example.st

install: package.xml QuickSmash.st example.st
	gst-package -t ~/.st package.xml

uninstall:
	-gst-package -t ~/.st package.xml
