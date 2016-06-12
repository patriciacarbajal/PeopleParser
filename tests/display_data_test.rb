require_relative '../lib/display_data'
require_relative '../lib/person'

require 'minitest/autorun'

class DisplayDataTest < Minitest::Unit::TestCase

  def setup
    @anna ||= Person.new(first_name: 'Anna', last_name: "Kournikova", gender: "Female", dob: "6/3/1975", color: "Red")
    @martina ||= Person.new(first_name: 'Martina', last_name: "Hingis", gender: "Female", dob: "4/2/1979", color: "Green")
    @radek ||= Person.new(first_name: 'Radek', last_name: "Bonk", gender: "Male", dob: "6/3/1975", color: "Green")
    @sue ||= Person.new(first_name: 'Sue', last_name: "Kelly", gender: "Female", dob: "7/12/1959", color: "Pink")
    @francis ||= Person.new(first_name: "Francis", last_name: "Bouillon", gender: "Male", dob: "6/3/1975", color: "Blue" )
    @people ||= [@anna, @martina, @radek, @sue, @francis]
  end

  def test_displays_formatted_lines
    assert_output("Hingis Martina Female 4/2/1979 Green\nKelly Sue Female 7/12/1959 Pink\nKournikova Anna Female 6/3/1975 Red\nBonk Radek Male 6/3/1975 Green\nBouillon Francis Male 6/3/1975 Blue\n") { DisplayData.display_formatted_lines(DisplayData.sort_by_gender_and_last_name(@people)) }
  end

  def test_displays_all_output
    assert_output("Output 1:\nHingis Martina Female 4/2/1979 Green\nKelly Sue Female 7/12/1959 Pink\nKournikova Anna Female 6/3/1975 Red\nBonk Radek Male 6/3/1975 Green\nBouillon Francis Male 6/3/1975 Blue\n\nOutput 2:\nKelly Sue Female 7/12/1959 Pink\nBonk Radek Male 6/3/1975 Green\nBouillon Francis Male 6/3/1975 Blue\nKournikova Anna Female 6/3/1975 Red\nHingis Martina Female 4/2/1979 Green\n\nOutput 3:\nKournikova Anna Female 6/3/1975 Red\nKelly Sue Female 7/12/1959 Pink\nHingis Martina Female 4/2/1979 Green\nBouillon Francis Male 6/3/1975 Blue\nBonk Radek Male 6/3/1975 Green\n") { DisplayData.display_all_output(@people)}
  end

  def test_sortable_by_gender_and_last_name
    assert_equal [@martina, @sue, @anna, @radek, @francis], DisplayData.sort_by_gender_and_last_name(@people)
  end

  def test_sortable_by_dob
    assert_equal [@sue, @radek, @francis, @anna, @martina], DisplayData.sort_by_dob(@people)
  end

  def test_sortable_by_last_name
    assert_equal [@anna, @sue, @martina, @francis, @radek], DisplayData.sort_by_last_name(@people)
  end
end