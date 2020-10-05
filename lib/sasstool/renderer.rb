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

  private

    def basename
      @basename ||= File.basename(path).gsub(/scss$/, 'css')
    end

    def scss_content
      scss_content ||= File.read(path)
    end

    def options
      @options ||= {
        source_map_file: "#{path.gsub(/scss$/, 'css')}.map",
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

