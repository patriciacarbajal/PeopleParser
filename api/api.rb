require 'grape'
require 'json'
require_relative '../lib/file_handler'
require_relative '../lib/person'

class API < Grape::API
  content_type :txt, 'text/plain'

  get '/home/:sort_by' do
    sort_order = params[:sort_by]
    people = FileHandler.convert_file_data_to_person(Person, "data/space.txt", "data/pipe.txt", "data/comma.txt")
    case sort_order
    when "1"
      data = DisplayData::sort_by_gender_and_last_name(people)
      DisplayData::display_formatted_lines(data)
    when "2"
      data = DisplayData::sort_by_dob(people)
      DisplayData::display_formatted_lines(data)
    when "3"
      data = DisplayData::sort_by_last_name(people)
      DisplayData::display_formatted_lines(data)
    when "all"
      DisplayData::display_all_output(people)
    else
      "error"
    end
  end
  
  resource :create_person do
    content_type :json, 'application/json'
    default_format :json
    rescue_from :all do |e|
      rack_response({ :message => "rescued from #{e.class.name}" })
    end

    params do
      requires :last_name, type: String
      requires :first_name, type: String
      requires :gender, type: String
      requires :color, type: String 
      requires :dob, type: String
    end

    post 'new' do
      # Person.create!({last_name: params[:last_name],
      #                 first_name: params[:first_name],
      #                 gender: params[:gender],
      #                 color: params[:color],
      #                 dob: params[:dob]})
      Person.create!({last_name: "Carbajal",
                      first_name: "Patriica",
                      gender: "F",
                      color: "Black",
                      dob: "11-17-1985"})
      # redirect_to '/home/all'
    end
  end
end
