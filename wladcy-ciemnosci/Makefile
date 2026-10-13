PYTHON ?= python3
SOURCES = $(wildcard src/*.fth) sources.json
ASSET_TOOLS = ../util/pack_assets.py tools/prepare.py
ASSETS := $(shell $(PYTHON) ../util/pack_assets.py --game-dir . --dependencies)
ifneq ($(.SHELLSTATUS),0)
$(error Cannot read assets/layout.json dependencies)
endif
FORTH_ASSETS = $(shell $(PYTHON) ../util/forth_assets.py --game wladcy-ciemnosci --dependencies)
SOURCE_INPUTS = $(SOURCES) $(FORTH_ASSETS) ../util/forth_assets.py

.PHONY: all assets test test-assets decompile clean sources music graphics test-graphics
all: build/wladcy-ciemnosci.atr build/sources.atr

build/assets.atr: $(ASSETS) $(ASSET_TOOLS)
	$(PYTHON) tools/prepare.py

assets: build/assets.atr

build/wladcy-ciemnosci.atr: $(SOURCE_INPUTS) tools/compile.py tools/shared.py ../ad2044/tools/compile.py reference/figforth.atr build/assets.atr
	$(PYTHON) tools/compile.py --manifest sources.json --disk3-template build/assets.atr --progress

build/sources.atr: $(SOURCE_INPUTS) tools/pack_sources.py
	$(PYTHON) tools/pack_sources.py

sources: build/sources.atr

music:
	$(PYTHON) ../util/extract_music.py --game wladcy-ciemnosci

graphics:
	$(PYTHON) ../util/extract_graphics.py --game wladcy-ciemnosci

test-graphics:
	$(PYTHON) ../util/extract_graphics.py --game wladcy-ciemnosci --check
	$(PYTHON) ../util/test_graphics_common.py
	$(PYTHON) tools/test_graphics.py

decompile:
	$(PYTHON) tools/recover.py
	$(PYTHON) tools/decompile.py

test-assets:
	$(PYTHON) ../util/test_pack_assets.py
	$(PYTHON) ../util/test_forth_assets.py

test: all test-graphics test-assets
	$(PYTHON) tools/test_pipeline.py
	$(PYTHON) tools/test_semantics.py
	$(PYTHON) ../ad2044/tools/test_text_records.py
	$(PYTHON) ../util/extract_music.py --game wladcy-ciemnosci --check
	$(PYTHON) ../util/test_cmc_playback.py
	$(PYTHON) tools/verify.py

clean:
	rm -rf build
