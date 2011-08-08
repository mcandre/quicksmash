all: package.xml QuickSmash.st example.st
	gst-package -t ~/.st package.xml &>/dev/null
	./example.st