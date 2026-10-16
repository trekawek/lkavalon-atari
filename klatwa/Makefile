PYTHON ?= python3
SOURCES = $(wildcard src/*.fth) sources.json
CONTENT_TOOLS = ../util/gam_content.py ../util/text_sections.py ../util/gam_limits.py ../util/gam_assets.py ../util/gam_world.py ../util/gam_program.py ../ad2044/tools/pictures.py
FORTH_TOOLS = ../util/gam_world.py ../util/gam_assets.py ../util/forth_assets.py ../ad2044/tools/pictures.py
ifneq ($(MAKECMDGOALS),clean)
# A success marker also works with macOS's GNU Make 3.81 (no .SHELLSTATUS).
ASSETS := $(shell $(PYTHON) ../util/gam_content.py --game-dir . --dependencies && printf ' __DEPENDENCIES_OK__')
ifeq ($(filter __DEPENDENCIES_OK__,$(ASSETS)),)
$(error Cannot read authored content dependencies)
endif
ASSETS := $(filter-out __DEPENDENCIES_OK__,$(ASSETS))
FORTH_ASSETS := $(shell $(PYTHON) ../util/forth_assets.py --game klatwa --dependencies && printf ' __DEPENDENCIES_OK__')
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

.PHONY: all assets sources music verify test test-content test-forth research clean FORCE
.DELETE_ON_ERROR:

all: build/klatwa.atr build/sources.atr

build/assets.atr: $(ASSETS) $(CONTENT_TOOLS)
	$(PYTHON) ../util/gam_content.py --game-dir .

assets: build/assets.atr

# The primary owns both outputs; a missing report must also trigger compilation.
# This serializes parallel consumers without Make 4.3's grouped-target syntax.
ifeq ($(wildcard build/program/compile-report.json),)
build/program/klatwa.atr: FORCE
endif
build/program/klatwa.atr: $(SOURCE_INPUTS) tools/compile.py tools/shared.py ../ad2044/tools/compile.py build/figforth.atr | build/empty.atr
	$(PYTHON) tools/compile.py --progress

build/program/compile-report.json: build/program/klatwa.atr
	@test -f $@

build/empty.atr: ../util/gam_program.py
	$(PYTHON) ../util/gam_program.py --empty-disk $@

build/klatwa.atr: build/program/klatwa.atr build/assets.atr ../util/gam_content.py ../util/gam_program.py
	$(PYTHON) ../util/gam_content.py --game-dir . --link build/program/klatwa.atr

build/sources.atr: $(SOURCE_INPUTS) tools/pack_sources.py
	$(PYTHON) tools/pack_sources.py

sources: build/sources.atr

music:
	$(PYTHON) ../util/extract_music.py --game klatwa

build/figforth.atr: $(COMPILER_INPUTS)
	$(PYTHON) ../util/build_figforth.py --output $@

verify: all
	$(PYTHON) tools/verify.py

test-content:
	$(PYTHON) ../util/test_forth_makefiles.py
	$(PYTHON) ../util/test_text_sections.py
	$(PYTHON) ../util/test_gam_assets.py
	$(PYTHON) ../util/test_gam_content.py
	$(PYTHON) ../util/test_gam_program.py
	$(PYTHON) ../util/test_gam_world.py
	$(PYTHON) ../util/test_gam_limits.py

test-forth: all
	$(PYTHON) tools/test_reconstruction.py
	$(PYTHON) tools/test_semantics.py

# Optional recovery catalogs are generated, not additional authored sources.
research: all
	$(PYTHON) tools/recover.py
	$(PYTHON) tools/decompile.py

test: test-content test-forth verify

clean:
	rm -rf build
