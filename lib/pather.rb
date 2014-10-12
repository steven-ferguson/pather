require 'line'

class Pather
  def initialize(input_filename:, output_filename:)
    @input_file_path = "./spec/#{input_filename}"
    @output_file_path = "./spec/#{output_filename}"
  end

  def process
    new_line = Line.new(File.read(@input_file_path)).transform
    File.write(@output_file_path, new_line)
  end
end