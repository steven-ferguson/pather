class Line
  def initialize(text)
    @text = text
  end

  def to_s
    @text
  end

  def has_waypoint?
    !waypoint_index.nil?
  end

  def waypoint_index
    @text.index(waypoint_marker)
  end

  def mark_path(index, ending_index=nil)
    if ending_index.nil?
      @text[index] = path_marker
    else
      length = ending_index - index + 1
      @text[index..ending_index] = path_marker * length
    end
  end

  def path_marker
    '*'
  end

  def waypoint_marker
    '#'
  end
end