require_relative '../lib/file_handler'
require_relative '../lib/person'
require 'minitest/autorun'

class FileHandlerTest < Minitest::Unit::TestCase

  def test_converts_file_data_to_person_objects
    people = FileHandler.convert_file_data_to_person(Person, "data/space.txt", "data/pipe.txt", "data/comma.txt")
    assert_equal 9, people.size
  end

  def test_correct_pipe_separator
    row_one = File.new("data/pipe.txt").readline
    separator = FileHandler.detect_separator(row_one)
    assert_equal "|", separator
  end

  def test_correct_comma_separator
    row_one =  File.new("data/comma.txt").readline
    separator = FileHandler.detect_separator(row_one)
    assert_equal ",", separator
  end

  def test_correct_space_separator
    row_one =  File.new("data/space.txt").readline
    separator = FileHandler.detect_separator(row_one)
    assert_equal " ", separator
  end
end
