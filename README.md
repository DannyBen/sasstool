Sasstool
==================================================

[![Gem Version](https://badge.fury.io/rb/sasstool.svg)](https://badge.fury.io/rb/sasstool)
[![Build Status](https://travis-ci.com/DannyBen/sasstool.svg?branch=master)](https://travis-ci.com/DannyBen/sasstool)

---

Sass (SassC) command line renderer with globbing import support.

---

Installation
--------------------------------------------------

    $ gem install sasstool



Usage
--------------------------------------------------

```
$ sasstool --help
sasstool - SASS Command Line Renderer

Usage:
  sasstool INFILE [OUTDIR --watch]
  sasstool (-h|--help)

Options:
  -w, --watch
    Watch the directory of the input file, and save on change

  -h --help
    Show this help

Parameters:
  INFILE
    Path to SCSS input file

  OUTDIR
    Path to CSS output directory. Can also be provided by an environment
    variable

Environment Variables:
  SASSTOOL_OUTDIR
    Path to CSS output directory

Examples:
  sasstool style/main.scss public/css

```