module DisplayData

  def self.display_all_output(people)
    puts "Output 1:"
    display_formatted_lines(sort_by_gender_and_last_name(people))
    puts "\nOutput 2:"
    display_formatted_lines(sort_by_dob(people))
    puts "\nOutput 3:"
    display_formatted_lines(sort_by_last_name(people))
  end

  def self.sort_by_last_name(people)
    people.sort_by { |person| person.last_name}.reverse
  end

  def self.sort_by_dob(people)
    people.sort_by { |person| [person.dob, person.last_name]}
  end

  def self.sort_by_gender_and_last_name(people)
    people.sort_by { |person| [person.gender, person.last_name] }
  end

  def self.display_formatted_lines(sorted_data)
    sorted_data.each { |person|  puts "#{person.last_name} #{person.first_name} #{person.gender} #{person.dob.strftime("%-m/%-d/%Y")} #{person.color}" }
  end

end