# Sasstool

[![Gem Version](https://badge.fury.io/rb/sasstool.svg)](https://badge.fury.io/rb/sasstool)
[![Build Status](https://github.com/DannyBen/sasstool/workflows/Test/badge.svg)](https://github.com/DannyBen/sasstool/actions?query=workflow%3ATest)
[![Maintainability](https://api.codeclimate.com/v1/badges/4cef96eefe9287ab6c90/maintainability)](https://codeclimate.com/github/DannyBen/sasstool/maintainability)

---

Sass (SassC) command line renderer with globbing import support.

---

## Installation

    $ gem install sasstool



## Usage

You can use Sasstool from the command line, or from within ruby code.


### Rendering from the command line

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

### Rendering from Ruby code

```ruby
sass = Sasstool::Renderer.new 'path/to/main.scss'

# Get the CSS string
sass.render

# Get the source map string
sass.source_map

# Save both CSS and source map
sass.save 'target/directory'
```

## Contributing / Support

If you experience any issue, have a question or a suggestion, or if you wish
to contribute, feel free to [open an issue][issues].

---

[issues]: https://github.com/DannyBen/sasstool/issues
