require 'rake/testtask'

task :default => [:test]

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.verbose = true
  t.test_files = FileList["test/**/*_test.rb"]
end
