require_relative '../lib/person'
require 'minitest/autorun'


class PersonTest < Minitest::Unit::TestCase

  def setup
    $anna ||= Person.new(first_name: 'Anna', last_name: "Kournikova", gender: "Female", dob: "6/3/1975", color: "Red")
    $martina ||= Person.new(first_name: 'Martina', last_name: "Hingis", gender: "Female", dob: "4/2/1979", color: "Green")
    $radek ||= Person.new(first_name: 'Radek', last_name: "Bonk", gender: "Male", dob: "6/3/1975", color: "Green")
    $sue ||= Person.new(first_name: 'Sue', last_name: "Kelly", gender: "Female", dob: "7/12/1959", color: "Pink")
    $francis ||= Person.new(first_name: "Francis", last_name: "Bouillon", gender: "Male", dob: "6/3/1975", color: "Blue" )
  end

  def test_person_has_first_name
    assert_equal "Anna", $anna.first_name
  end

  def test_person_has_last_name
    assert_equal "Bonk", $radek.last_name
  end

  def test_person_has_gender
    assert_equal "Male", $francis.gender
  end

  def test_person_has_dob
    assert_equal "4/2/1979", $martina.dob.strftime('%-m/%-d/%Y')
  end

  def test_person_has_color
    assert_equal "Pink", $sue.color
  end
end
