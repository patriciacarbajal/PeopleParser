require 'date'
require_relative 'display_data'

class Person
  attr_reader :last_name, :first_name, :gender, :dob, :color
  
  def initialize(options={})
    @last_name = options[:last_name] if options[:last_name]
    @first_name = options[:first_name] if options[:first_name]
    @gender = format_gender(options[:gender]) if options[:gender]
    @dob = format_dob(options[:dob]) if options[:dob]
    @color = options[:color] if options[:color]
  end

  private

    def format_gender(gender)
      gender == "M" ? "Male" : gender == "F" ? "Female" : gender
    end

    def format_dob(dob)
      dob.gsub!("-", "/")
      Date.strptime(dob, "%m/%d/%Y")
    end
end