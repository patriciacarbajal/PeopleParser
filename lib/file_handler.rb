require_relative 'parsers'

  module FileHandler
    include FileParsers

    def self.convert_file_data_to_person(klass, *files)
      people = []
      files.each do |file|
        row_one = File.new(file).readline
        row_separator = detect_separator(row_one)
        file_handler = separator_options[row_separator]
        attribute_option_hashes = file_handler.new(file).attribute_option_hash
        people << construct_person_from_options(attribute_option_hashes, klass)
      end
      people.flatten
    end

    private

      def self.detect_separator(row)
        separator_options.keys.find { |separator| row.include? separator }
      end

      def self.separator_options
        {"," => HandleCommaSeparated,
         "|" => HandlePipeSeparated,
         " " => HandleSpaceSeparated}
      end

      def self.construct_person_from_options(hashes, klass)
        hashes.map { |person| klass.new (person) }
      end
  end