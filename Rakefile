# encoding: utf-8

__DIR__ = File.dirname(__FILE__)

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rake'

require "#{__DIR__}/tasks/distribution"
require "#{__DIR__}/tasks/testing"

Dir.glob("#{__DIR__}/tasks/*.rake").each { |rake_file| import rake_file }
