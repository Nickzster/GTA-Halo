.PHONY: build deploy

POSTGAME_TIMESTAMP ?= 5000

build:
	cd sapp; \
	python3 bundler.py

deploy: 
	cp sapp/gta_halo_v2.lua /mnt/c/Users/nicho/Documents/"My Games/Halo CE"/sapp/lua/gta_halo_v2.lua



