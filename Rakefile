# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

require 'rubocop/rake_task'

RuboCop::RakeTask.new

desc 'Run benchmark/run.rb (regression baseline for JSON.repair)'
task :bench do
  ruby '-Ilib', 'benchmark/run.rb'
end

task default: %i[spec rubocop]
