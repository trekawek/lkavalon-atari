PYTHON ?= python3
SOURCES = $(wildcard src/*.fth) sources.json
CONTENT_TOOLS = ../util/gam_content.py ../util/gam_limits.py ../util/gam_assets.py ../util/gam_world.py ../util/gam_program.py ../ad2044/tools/pictures.py
FORTH_TOOLS = ../util/gam_world.py ../util/gam_assets.py ../util/forth_assets.py ../ad2044/tools/pictures.py
ifneq ($(MAKECMDGOALS),clean)
ASSETS := $(shell $(PYTHON) ../util/gam_content.py --game-dir . --dependencies)
ifneq ($(.SHELLSTATUS),0)
$(error Cannot read authored content dependencies)
endif
FORTH_ASSETS := $(shell $(PYTHON) ../util/forth_assets.py --game wladcy-ciemnosci --dependencies)
ifneq ($(.SHELLSTATUS),0)
$(error Cannot read embedded Forth asset dependencies)
endif
SOURCE_INPUTS = $(SOURCES) $(FORTH_ASSETS) $(FORTH_TOOLS)
COMPILER_INPUTS := $(shell $(PYTHON) ../util/build_figforth.py --dependencies)
ifneq ($(.SHELLSTATUS),0)
$(error Cannot read fig-Forth source dependencies)
endif
endif

.PHONY: all assets sources music verify test test-content test-forth research clean

all: build/wladcy-ciemnosci.atr build/sources.atr

build/assets.atr: $(ASSETS) $(CONTENT_TOOLS)
	$(PYTHON) ../util/gam_content.py --game-dir .

assets: build/assets.atr

build/program/wladcy-ciemnosci.atr build/program/compile-report.json &: $(SOURCE_INPUTS) tools/compile.py tools/shared.py ../ad2044/tools/compile.py build/figforth.atr | build/empty.atr
	$(PYTHON) tools/compile.py --progress

build/empty.atr: ../util/gam_program.py
	$(PYTHON) ../util/gam_program.py --empty-disk $@

build/wladcy-ciemnosci.atr: build/program/wladcy-ciemnosci.atr build/assets.atr ../util/gam_content.py ../util/gam_program.py
	$(PYTHON) ../util/gam_content.py --game-dir . --link build/program/wladcy-ciemnosci.atr

build/sources.atr: $(SOURCE_INPUTS) tools/pack_sources.py
	$(PYTHON) tools/pack_sources.py

sources: build/sources.atr

music:
	$(PYTHON) ../util/extract_music.py --game wladcy-ciemnosci

build/figforth.atr: $(COMPILER_INPUTS)
	$(PYTHON) ../util/build_figforth.py --output $@

verify: all
	$(PYTHON) tools/verify.py

test-content:
	$(PYTHON) ../util/test_gam_assets.py
	$(PYTHON) ../util/test_gam_content.py
	$(PYTHON) ../util/test_gam_program.py
	$(PYTHON) ../util/test_gam_world.py
	$(PYTHON) ../util/test_gam_limits.py

test-forth: all
	$(PYTHON) tools/test_pipeline.py
	$(PYTHON) tools/test_semantics.py

# Optional recovery catalogs are generated, not additional authored sources.
research: all
	$(PYTHON) tools/recover.py
	$(PYTHON) tools/decompile.py

test: test-content test-forth verify

clean:
	rm -rf build
