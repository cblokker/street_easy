require "bundler/gem_tasks"

require 'rake/testtask'
Rake::TestTask.new do |test|
  test.libs << 'lib' << 'test'
  test.ruby_opts << "-rubygems"
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end
 
# test/helper.rb
require 'street_easy'
require 'minitest/spec'
require 'minitest/autorun'

