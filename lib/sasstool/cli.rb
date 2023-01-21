require 'mister_bin'
require 'sasstool'
require_relative 'command'

module Sasstool
  class CLI
    def self.router
      MisterBin::Runner.new version: VERSION,
        header: 'SASS Tool',
        handler: Command
    end
  end
end
