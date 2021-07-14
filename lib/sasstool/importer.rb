module Sasstool
  class Importer < SassC::Importer
    def imports(path, parent_path)
      if path.include? "*"
        dir = File.dirname parent_path
        glob = "#{dir}/#{path}"
        files = Dir[glob].select do |file|
          ['.scss', '.sass'].include? File.extname(file)
        end

        files.map do |file|
          Import.new File.expand_path(file)
        end
      else
        Import.new path
      end
    end
  end
end