# nsxiv version
VERSION = 34
# PREFIX for install
PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man
EGPREFIX = $(PREFIX)/share/doc/nsxiv/examples
# default value for optional dependencies. 1 = enabled, 0 = disabled
OPT_DEP_DEFAULT = 1
# autoreload backend: 1 = inotify, 0 = none
HAVE_INOTIFY = $(OPT_DEP_DEFAULT)
# optional dependencies, see README for more info
HAVE_LIBFONTS = $(OPT_DEP_DEFAULT)
HAVE_LIBEXIF  = $(OPT_DEP_DEFAULT)

# --- build tooling ---
CCACHE  := $(shell command -v ccache 2>/dev/null)
CC      := $(CCACHE) clang
NPROC   := $(shell nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 4)
MAKEFLAGS += -j$(NPROC)

# override with NATIVE=0 for portable/CI builds
NATIVE ?= 1
ifeq ($(NATIVE),1)
ARCH_FLAGS = -march=native
else
ARCH_FLAGS = -march=x86-64-v2
endif

# CFLAGS, any additional compiler flags goes here
CFLAGS = -Wall -pedantic -O2 -DNDEBUG $(ARCH_FLAGS)
# Uncomment for a debug build using gcc/clang
# CFLAGS = -Wall -pedantic -DDEBUG -g3 -fsanitize=address,undefined
# LDFLAGS = $(CFLAGS)

# icons that will be installed via `make icon`
ICONS = 16x16.png 32x32.png 48x48.png 64x64.png 128x128.png

# Uncomment on OpenBSD
# HAVE_INOTIFY = 0
# lib_fonts_bsd_0 =
# lib_fonts_bsd_1 = -lfreetype -L/usr/X11R6/lib/freetype2
# inc_fonts_bsd_0 =
# inc_fonts_bsd_1 = -I/usr/X11R6/include/freetype2
# CPPFLAGS = -I/usr/X11R6/include -I/usr/local/include $(inc_fonts_bsd_$(HAVE_LIBFONTS))
# LDLIBS = -L/usr/X11R6/lib -L/usr/local/lib $(lib_fonts_bsd_$(HAVE_LIBFONTS))
