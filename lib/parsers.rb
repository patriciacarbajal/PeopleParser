module FileParsers
  class FileParser
    attr_reader :attribute_option_hash
    
    def initialize(file, separator, ordered_person_attribute_options)
      @ordered_person_attribute_options = ordered_person_attribute_options
      @attribute_option_hash = file_to_hash(file, separator)
    end

    private

    def file_to_hash(file, separator)
      rows = IO.readlines(file)
      rows.map do  |row| 
        split_row = row.split(separator)
        row_to_hash(split_row)
      end
    end

    def row_to_hash(row)
      row.map!(&:strip)
      Hash[@ordered_person_attribute_options.zip(row)]
    end

  end

  class HandleSpaceSeparated < FileParser
    def initialize(file)
      super(file, " ", ordered_space_attribute_options)
    end

    def ordered_space_attribute_options
      [:last_name, :first_name, :middle_initial, :gender, :dob, :color]
    end
  end

  class HandleCommaSeparated < FileParser
    def initialize(file)
      super(file, ",", ordered_comma_attribute_options)
    end

    def ordered_comma_attribute_options
      [:last_name, :first_name, :gender, :color, :dob]
    end
  end

  class HandlePipeSeparated < FileParser
    def initialize(file)
      super(file,"|", ordered_pipe_attribute_options)
    end

    def ordered_pipe_attribute_options
      [:last_name, :first_name, :middle_initial, :gender, :color, :dob]
    end
  end
end