# Product Date Added v1.0 (https://github.com/underr-ua/ocmod3-product-date-added)
# Copyright 2018 Burkatskyi Andrii aka underr
# EULA - https://raw.githubusercontent.com/underr-ua/product-date-added/master/EULA.txt

zip=$(shell basename `pwd`).ocmod.zip

license=EULA.txt
readme=README.md
datetime=201801010000.00
src=src
bin=bin


all: checkg clean makedir timestamp makezip hideg

checkg:
	@if [ ! -f "hideg.pwd" ]; then hideg; fi

makedir:
	mkdir -p "$(bin)"

timestamp:
	find . -exec touch -a -m -t $(datetime) {} \;

makezip:
	cd "$(src)" && zip -9qrX "../$(bin)/$(zip)" * && cd .. && zip -9qrX "$(bin)/$(zip)" "$(readme)" "$(license)"

hideg: hideg.pwd
	hideg "$(bin)/$(zip)"

clean:
	@echo Cleaning...
	@rm -f "$(bin)"/*.*
	@rm -f "$(src)"/*.zip
	@rm -f "$(src)/$(license)"
	@rm -f "$(src)/$(readme)"
