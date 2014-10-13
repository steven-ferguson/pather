require 'line'

class Pather
  attr_reader :state, :starting_waypoint_index, :ending_waypoint_index

  def initialize(input_filename:, output_filename:)
    @input_file_path = "./spec/#{input_filename}"
    @output_file_path = "./spec/#{output_filename}"
    @state = :searching_for_start
  end

  def process
    File.foreach("@input_file_path") do |text|
      process_line(text)
    end
  end

  def process_line(line)
    new_line = Line.new(line)

    if searching_for_start?
      if new_line.has_waypoint?
        set_starting_waypoint(new_line.waypoint_index)
      end

      return new_line.to_s
    end

    if building_path?
      if new_line.has_waypoint?
        set_ending_waypoint(new_line.waypoint_index)
        new_line.mark_path(starting_waypoint_index, ending_waypoint_index - 1)
      else
        new_line.mark_path(starting_waypoint_index)
      end

      return new_line.to_s
    end
  end

  def set_starting_waypoint(index)
    @starting_waypoint_index = index
    @state = :building_path
  end

  def set_ending_waypoint(index)
    @ending_waypoint_index = index
    @state = :path_complete
  end

  def searching_for_start?
    @state == :searching_for_start
  end

  def building_path?
    @state == :building_path
  end
end