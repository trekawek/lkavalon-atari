PYTHON ?= python3
SOURCES = $(wildcard src/*.fth) sources.json

.PHONY: all test decompile clean sources
all: build/wladcy-ciemnosci.atr build/sources.atr

build/assets.atr: assets/disk-tail.bin tools/prepare.py
	$(PYTHON) tools/prepare.py

build/wladcy-ciemnosci.atr: $(SOURCES) tools/compile.py reference/figforth.atr build/assets.atr
	$(PYTHON) tools/compile.py --manifest sources.json --disk3-template build/assets.atr --progress

build/sources.atr: $(SOURCES) tools/pack_sources.py
	$(PYTHON) tools/pack_sources.py

sources: build/sources.atr

decompile:
	$(PYTHON) tools/recover.py
	$(PYTHON) tools/decompile.py

test: all
	$(PYTHON) tools/test_pipeline.py
	$(PYTHON) ../ad2044/tools/test_text_records.py
	$(PYTHON) tools/verify.py

clean:
	rm -rf build
