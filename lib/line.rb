class Line
  def initialize(text)
    @text = text
  end

  def has_two_waypoints?
    first_waypoint_index != last_waypoint_index
  end

  def to_s
    @text
  end

  def first_waypoint_index
    @text.index(waypoint_marker)
  end

  def last_waypoint_index
    @text.rindex(waypoint_marker)
  end

  def mark_path(index, ending_index=nil)
    ending_index ||= index

    (index..ending_index).each do |i|
      mark_character(i)
    end
  end

  def path_marker
    '*'
  end

  def waypoint_marker
    '#'
  end

  private
  def mark_character(index)
    if @text[index] != waypoint_marker
      @text[index] = path_marker
    end
  end
end