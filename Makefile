all: package.xml quicksmash.st example.st
	gst-package -t ~/.st package.xml &>/dev/null
	./example.st