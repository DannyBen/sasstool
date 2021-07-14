require 'forwardable'

module Sasstool
  class Renderer
    extend Forwardable
    def_delegators :engine, :render, :source_map
    attr_reader :path

    def initialize(path)
      @path = path
    end

    def save(target_dir)
      name = "#{target_dir}/#{basename}"
      File.write name, render
      File.write "#{name}.map", source_map
    end

    def sass?
      path.end_with? 'sass'
    end

    def to_scss
      SassC::Sass2Scss.convert file_content
    end

  private

    def basename
      @basename ||= File.basename(path).gsub(/s[ca]ss$/, 'css')
    end

    def file_content
      @file_content ||= File.read(path)
    end

    def scss_content
      @scss_content ||= scss_content!
    end

    def scss_content!
      sass? ? to_scss : file_content
    end

    def options
      @options ||= {
        source_map_file: "#{path.gsub(/s[ca]ss$/, 'css')}.map",
        source_map_contents: true,
        style: :nested,
        importer: Importer,
        filename: path
      }
    end

    def engine
      @engine ||= SassC::Engine.new(scss_content, options)
    end
  end
end

