require 'simplecov'
SimpleCov.start

require 'rubygems'
require 'bundler'
Bundler.require :default, :development

require 'sasstool/cli'

include Sasstool
system 'mkdir -p spec/tmp'
