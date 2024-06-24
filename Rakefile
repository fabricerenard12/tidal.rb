# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'rdoc/task'

RSpec::Core::RakeTask.new(:spec)

RDoc::Task.new do |rdoc|
  rdoc.rdoc_dir = 'docs'
  rdoc.title    = 'Tidal API Client Documentation'
  rdoc.options  = ['--main', 'README.md']
  rdoc.rdoc_files.include('README.md', 'lib/**/*.rb')
end


task default: :spec
