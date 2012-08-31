#!/usr/bin/env rake
require "bundler/gem_tasks"
require "rake/testtask"
require "yard"

desc "generate documentation"
YARD::Rake::YardocTask.new do |task|
  task.files << 'lib/**/*.rb'
end

desc "run the minitest specs"
Rake::TestTask.new(:spec) do |task|
  task.libs << "spec"
  task.test_files = FileList["spec/**/*_spec.rb"]
end

task :default => [:spec, :build, :yard]