class Line
  attr_reader :text

  def initialize(text)
    @characters = text.split('')
  end

  def transform
    key_character_count = 0

    @characters.map do |character|
      if character == '#'
        key_character_count += 1
        character
      elsif key_character_count == 1
        '*'
      else
        character
      end
    end.join('')
  end
end