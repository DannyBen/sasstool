require 'listen'

module Sasstool
  class Command < MisterBin::Command
    help 'sasstool - SASS Command Line Renderer'
    usage 'sasstool INFILE [OUTDIR --watch]'
    usage 'sasstool (-h|--help)'

    param 'INFILE', 'Path to SCSS or SASS input file'
    param 'OUTDIR', 'Path to CSS output directory. Can also be provided by an environment variable'
    option '-w, --watch', 'Watch the directory of the input file, and save on change'
    environment 'SASSTOOL_OUTDIR', 'Path to CSS output directory'

    example 'sasstool style/main.scss public/css'

    def run
      save
      watch if args['--watch']
    end

  private

    def watch
      dir = @dir ||= File.dirname(args['INFILE'])
      glob = /\.s[ca]ss\z/
      l = listener(dir, glob) { save }
      l.start
      Blocker.block
    end

    def save
      renderer.save outdir
      say 'Saved'
    end

    def renderer
      Renderer.new args['INFILE']
    end

    def outdir
      result = args['OUTDIR'] || ENV['SASSTOOL_OUTDIR']
      raise ArgumentError, 'Please provide an output directory' unless result

      result
    end

    def listener(dir, glob, &)
      Listen.to(dir, force_polling: true, latency: 3, only: glob, &)
    end
  end
end
