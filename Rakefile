require 'rake/testtask'
require_relative 'lib/display_data'
require_relative 'lib/file_handler'
require_relative 'lib/person'


desc "Run all tests"
Rake::TestTask.new('test') do |t|
  t.pattern = 'tests/*_test.rb'
end

desc "Parse, sort, and display person data from txt files"
task :run do
  people = FileHandler.convert_file_data_to_person(Person, "data/space.txt", "data/pipe.txt", "data/comma.txt")
  DisplayData::display_all_output(people)
end
