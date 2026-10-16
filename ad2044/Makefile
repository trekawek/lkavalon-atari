PYTHON ?= python3
SOURCES = $(wildcard src/*.fth) sources.json
CONTENT_TOOLS = tools/content.py tools/disk.py tools/world.py tools/room_text.py tools/pictures.py ../util/text_sections.py
FORTH_TOOLS = ../util/forth_assets.py
ifneq ($(MAKECMDGOALS),clean)
# A success marker also works with macOS's GNU Make 3.81 (no .SHELLSTATUS).
ASSETS := $(shell $(PYTHON) tools/content.py --dependencies && printf ' __DEPENDENCIES_OK__')
ifeq ($(filter __DEPENDENCIES_OK__,$(ASSETS)),)
$(error Cannot read authored content dependencies)
endif
ASSETS := $(filter-out __DEPENDENCIES_OK__,$(ASSETS))
FORTH_ASSETS := $(shell $(PYTHON) ../util/forth_assets.py --game ad2044 --dependencies && printf ' __DEPENDENCIES_OK__')
ifeq ($(filter __DEPENDENCIES_OK__,$(FORTH_ASSETS)),)
$(error Cannot read embedded Forth asset dependencies)
endif
FORTH_ASSETS := $(filter-out __DEPENDENCIES_OK__,$(FORTH_ASSETS))
SOURCE_INPUTS = $(SOURCES) $(FORTH_ASSETS) $(FORTH_TOOLS)
COMPILER_INPUTS := $(shell $(PYTHON) ../util/build_figforth.py --dependencies && printf ' __DEPENDENCIES_OK__')
ifeq ($(filter __DEPENDENCIES_OK__,$(COMPILER_INPUTS)),)
$(error Cannot read fig-Forth source dependencies)
endif
COMPILER_INPUTS := $(filter-out __DEPENDENCIES_OK__,$(COMPILER_INPUTS))
endif

.PHONY: all assets sources music verify test test-content test-forth clean FORCE
.DELETE_ON_ERROR:

all: build/ad2044-side1.atr build/ad2044-side2.atr build/sources.atr

# One recipe owns each output pair, including parallel builds on Make 3.81.
# Rebuild the pair if its companion was deleted while the primary survived.
ifeq ($(wildcard build/ad2044-side2.atr),)
build/assets-side1.atr: FORCE
endif
build/assets-side1.atr: $(ASSETS) $(CONTENT_TOOLS)
	$(PYTHON) tools/content.py

build/ad2044-side2.atr: build/assets-side1.atr
	@test -f $@

assets: build/assets-side1.atr build/ad2044-side2.atr

ifeq ($(wildcard build/program/compile-report.json),)
build/program/ad2044-side1.atr: FORCE
endif
build/program/ad2044-side1.atr: $(SOURCE_INPUTS) tools/compile.py build/figforth.atr | build/empty.atr
	$(PYTHON) tools/compile.py --reference build/figforth.atr --manifest sources.json --disk3-template build/empty.atr --output-dir build/program --progress

build/program/compile-report.json: build/program/ad2044-side1.atr
	@test -f $@

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
	$(PYTHON) ../util/test_forth_makefiles.py
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
