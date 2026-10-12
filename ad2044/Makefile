PYTHON ?= python3
SOURCES = $(wildcard src/*.fth) sources.json

.PHONY: all test decompile clean sources music graphics test-graphics

all: build/ad2044-side1.atr build/ad2044-side2.atr build/sources.atr

build/assets-side1.atr build/ad2044-side2.atr &: assets/side1-tail.bin assets/side2-data.bin tools/prepare.py
	$(PYTHON) tools/prepare.py

build/ad2044-side1.atr: $(SOURCES) tools/compile.py reference/figforth.atr build/assets-side1.atr
	$(PYTHON) tools/compile.py --manifest sources.json --disk3-template build/assets-side1.atr --progress

build/sources.atr: $(SOURCES) tools/pack_sources.py
	$(PYTHON) tools/pack_sources.py

sources: build/sources.atr

music:
	$(PYTHON) ../util/extract_music.py --game ad2044

graphics:
	$(PYTHON) ../util/extract_graphics.py --game ad2044

test-graphics:
	$(PYTHON) ../util/extract_graphics.py --game ad2044 --check
	$(PYTHON) ../util/test_graphics_common.py
	$(PYTHON) tools/test_graphics.py

decompile:
	$(PYTHON) tools/decompile.py

test: all test-graphics
	$(PYTHON) tools/test_compiler.py
	$(PYTHON) tools/test_decompiler.py
	$(PYTHON) tools/test_text_records.py
	$(PYTHON) ../util/extract_music.py --game ad2044 --check
	$(PYTHON) tools/test_music_sap.py
	$(PYTHON) tools/verify.py

clean:
	rm -rf build
