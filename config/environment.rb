RACK_ENV = ENV['RACK_ENV'] ||= 'development'
RACK_ROOT = File.expand_path('..', File.dirname(__FILE__))
%w[ . lib ].each do |load_path|
  $:.unshift File.join(RACK_ROOT, load_path)
end

require 'bundler/setup'
require 'sinatra'
require 'app'
