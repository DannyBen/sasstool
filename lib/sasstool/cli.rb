require 'mister_bin'
require 'sasstool'
require_relative 'command'

module Sasstool
  class CLI
    def self.router
      router = MisterBin::Runner.new version: VERSION,
        header: "SASS Tool"

      router.route_all to: Command

      router
    end
  end
end
