PYTHON ?= python3
SOURCES = $(wildcard src/*.fth) sources.json
STRUCTURED_TOOLS = ../util/structured_assets.py ../util/asm6502.py ../util/sound_assets.py ../ad2044/tools/asset_formats.py ../klatwa/tools/asset_formats.py
ASSET_TOOLS = ../util/pack_assets.py tools/prepare.py $(STRUCTURED_TOOLS)
ASSETS := $(shell $(PYTHON) ../util/pack_assets.py --game-dir . --dependencies)
ifneq ($(.SHELLSTATUS),0)
$(error Cannot read assets/layout.json dependencies)
endif
FORTH_ASSETS = $(shell $(PYTHON) ../util/forth_assets.py --game klatwa --dependencies)
SOURCE_INPUTS = $(SOURCES) $(FORTH_ASSETS) ../util/forth_assets.py $(STRUCTURED_TOOLS)
COMPILER_INPUTS := $(shell $(PYTHON) ../util/build_figforth.py --dependencies)
ifneq ($(.SHELLSTATUS),0)
$(error Cannot read fig-Forth source dependencies)
endif
.PHONY: all assets test test-assets decompile clean sources music graphics test-graphics
all: build/klatwa.atr build/sources.atr
build/assets.atr: $(ASSETS) $(ASSET_TOOLS)
	$(PYTHON) tools/prepare.py
assets: build/assets.atr
build/klatwa.atr: $(SOURCE_INPUTS) tools/compile.py tools/shared.py ../ad2044/tools/compile.py reference/figforth.atr build/assets.atr
	$(PYTHON) tools/compile.py --progress
build/sources.atr: $(SOURCE_INPUTS) tools/pack_sources.py
	$(PYTHON) tools/pack_sources.py
sources: build/sources.atr
reference/figforth.atr: $(COMPILER_INPUTS)
	$(PYTHON) ../util/build_figforth.py --output $@

music:
	$(PYTHON) ../util/extract_music.py --game klatwa
graphics:
	$(PYTHON) ../util/extract_graphics.py --game klatwa
test-graphics:
	$(PYTHON) ../util/extract_graphics.py --game klatwa --check
	$(PYTHON) ../util/test_graphics_common.py
	$(PYTHON) tools/test_graphics.py
decompile:
	$(PYTHON) tools/recover.py
	$(PYTHON) tools/decompile.py
test-assets:
	$(PYTHON) ../util/test_pack_assets.py
	$(PYTHON) ../util/test_forth_assets.py
	$(PYTHON) ../util/test_structured_assets.py
	$(PYTHON) ../util/figforth/test_builder.py
test: all test-graphics test-assets
	$(PYTHON) tools/test_reconstruction.py
	$(PYTHON) tools/test_semantics.py
	$(PYTHON) ../ad2044/tools/test_text_records.py
	$(PYTHON) ../util/extract_music.py --game klatwa --check
	$(PYTHON) tools/verify.py
clean:
	rm -rf build
