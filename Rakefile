# frozen_string_literal: true

require "rspec/core/rake_task"

desc "Run all tests headless"
task 'spec_headless' do
  ENV["HEADLESS"] = 'true'
  RSpec::Core::RakeTask.new(:spec_headless)
end

desc "Run all tests headful."
task 'spec' do
  ENV["HEADLESS"] = 'false'
  RSpec::Core::RakeTask.new(:spec)
end

require "rubocop/rake_task"

RuboCop::RakeTask.new

task default: %i[spec rubocop]
