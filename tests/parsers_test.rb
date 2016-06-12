require_relative '../lib/parsers'
require 'minitest/autorun'

class FileParserTest < Minitest::Unit::TestCase

  def test_handle_commas_separated_file
    actual_hash = FileParsers::HandleCommaSeparated.new("data/comma.txt").attribute_option_hash

    expected_hash = [{:last_name=>"Abercrombie", :first_name=>"Neil", :gender=>"Male", :color=>"Tan", :dob=>"2/13/1943"},
       {:last_name=>"Bishop", :first_name=>"Timothy", :gender=>"Male", :color=>"Yellow", :dob=>"4/23/1967"},
       {:last_name=>"Kelly", :first_name=>"Sue", :gender=>"Female", :color=>"Pink", :dob=>"7/12/1959"}]
    assert_equal  expected_hash, actual_hash
  end

  def test_handle_pipe_separated_file
    actual_hash = FileParsers::HandlePipeSeparated.new("data/pipe.txt").attribute_option_hash

    expected_hash = [{:last_name=>"Smith", :first_name=>"Steve", :middle_initial=>"D", :gender=>"M", :color=>"Red", :dob=>"3-3-1985"},
      {:last_name=>"Bonk", :first_name=>"Radek", :middle_initial=>"S", :gender=>"M", :color=>"Green", :dob=>"6-3-1975"},
      {:last_name=>"Bouillon", :first_name=>"Francis", :middle_initial=>"G", :gender=>"M", :color=>"Blue", :dob=>"6-3-1975"}]
    assert_equal  expected_hash, actual_hash
  end

  def test_handle_space_separated_file
    actual_hash = FileParsers::HandleSpaceSeparated.new("data/space.txt").attribute_option_hash
    expected_hash = [{:last_name=>"Kournikova", :first_name=>"Anna", :middle_initial=>"F", :gender=>"F", :dob=>"6-3-1975", :color=>"Red"},
      {:last_name=>"Hingis", :first_name=>"Martina", :middle_initial=>"M", :gender=>"F", :dob=>"4-2-1979", :color=>"Green"},
      {:last_name=>"Seles", :first_name=>"Monica", :middle_initial=>"H", :gender=>"F", :dob=>"12-2-1973", :color=>"Black"}]
    assert_equal  expected_hash, actual_hash
  end
end
