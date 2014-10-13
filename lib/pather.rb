require './lib/line'

class Pather
  attr_reader :starting_waypoint_index, :ending_waypoint_index

  def initialize(input_filename:, output_filename:)
    @input_file_path = "./#{input_filename}"
    @output_file_path = "./#{output_filename}"
  end

  def process
    File.open(@output_file_path, 'w') do |output_file|
      File.foreach(@input_file_path) do |text|
        line = Line.new(text)
        output_file.write(process_line(line))
      end
    end
  end

  def process_line(line)
    locate_waypoints(line)
    build_path(line)
    line.to_s
  end

  def locate_waypoints(line)
    if line.has_two_waypoints?
      set_starting_waypoint(line.first_waypoint_index)
      set_ending_waypoint(line.last_waypoint_index)
    else
      set_waypoint(line.first_waypoint_index)
    end
  end

  def build_path(line)
    if building_path?(line)
      line.mark_path(starting_waypoint_index, ending_waypoint_index)
    end
  end

  def set_waypoint(index)
    if starting_waypoint_index
      set_ending_waypoint(index)
    else
      set_starting_waypoint(index)
    end
  end

  def set_starting_waypoint(index)
    @starting_waypoint_index = index
  end

  def set_ending_waypoint(index)
    @ending_waypoint_index ||= index
  end

  def building_path?(line)
    starting_waypoint_index && (ending_waypoint_index.nil? || line.last_waypoint_index == ending_waypoint_index)
  end
end