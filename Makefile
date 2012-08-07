# Makefile for rulers persistence plugin

all: build compress

compress:
	yui-compressor --type js $(dir_)js/rulers.js > $(dir_)js/rulers.min.js
	yui-compressor --type css $(dir_)css/rulers.css > $(dir_)css/rulers.min.css

build: dirs
	coffee --join $(dir_)js/rulers.js --compile coffee/*.coffee
	lessc less/main.less $(dir_)css/rulers.css

dirs:
	@mkdir $(dir_)js $(dir_)css &>/dev/null

clean:
	rm -rf css/rulers.css css/rulers.min.css js/rulers.js js/rulers.min.js

.PONY: clean build compress all
