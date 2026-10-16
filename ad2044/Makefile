PYTHON ?= python3
SOURCES = $(wildcard src/*.fth) sources.json
CONTENT_TOOLS = tools/content.py tools/disk.py tools/world.py tools/room_text.py tools/pictures.py ../util/text_sections.py
FORTH_TOOLS = ../util/forth_assets.py
ifneq ($(MAKECMDGOALS),clean)
ASSETS := $(shell $(PYTHON) tools/content.py --dependencies)
ifneq ($(.SHELLSTATUS),0)
$(error Cannot read authored content dependencies)
endif
FORTH_ASSETS := $(shell $(PYTHON) ../util/forth_assets.py --game ad2044 --dependencies)
ifneq ($(.SHELLSTATUS),0)
$(error Cannot read embedded Forth asset dependencies)
endif
SOURCE_INPUTS = $(SOURCES) $(FORTH_ASSETS) $(FORTH_TOOLS)
COMPILER_INPUTS := $(shell $(PYTHON) ../util/build_figforth.py --dependencies)
ifneq ($(.SHELLSTATUS),0)
$(error Cannot read fig-Forth source dependencies)
endif
endif

.PHONY: all assets sources music verify test test-content test-forth clean

all: build/ad2044-side1.atr build/ad2044-side2.atr build/sources.atr

build/assets-side1.atr build/ad2044-side2.atr &: $(ASSETS) $(CONTENT_TOOLS)
	$(PYTHON) tools/content.py

assets: build/assets-side1.atr build/ad2044-side2.atr

build/program/ad2044-side1.atr build/program/compile-report.json &: $(SOURCE_INPUTS) tools/compile.py build/figforth.atr | build/empty.atr
	$(PYTHON) tools/compile.py --reference build/figforth.atr --manifest sources.json --disk3-template build/empty.atr --output-dir build/program --progress

build/empty.atr: tools/disk.py
	$(PYTHON) tools/content.py --empty-disk $@

build/ad2044-side1.atr: build/program/ad2044-side1.atr build/assets-side1.atr tools/content.py
	$(PYTHON) tools/content.py --link build/program/ad2044-side1.atr

build/sources.atr: $(SOURCE_INPUTS) tools/pack_sources.py
	$(PYTHON) tools/pack_sources.py

sources: build/sources.atr

music:
	$(PYTHON) ../util/extract_music.py --game ad2044

build/figforth.atr: $(COMPILER_INPUTS)
	$(PYTHON) ../util/build_figforth.py --output $@

verify: all
	$(PYTHON) tools/verify.py

test-content:
	$(PYTHON) ../util/test_text_sections.py
	$(PYTHON) tools/test_content.py
	$(PYTHON) tools/test_world.py
	$(PYTHON) tools/test_disk.py
	$(PYTHON) tools/test_room_text.py
	$(PYTHON) tools/test_pictures.py
	$(PYTHON) tools/test_verify.py

test-forth: all
	$(PYTHON) tools/test_compiler.py
	$(PYTHON) tools/test_assembler.py
	$(PYTHON) tools/test_semantics.py

test: test-content test-forth verify

clean:
	rm -rf build
