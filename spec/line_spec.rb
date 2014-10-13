require 'line'

describe Line do
  describe '#has_two_waypoints?' do
    context 'when the line has two waypoints' do
      it 'returns true' do
        line = Line.new('#..#')

        result = line.has_two_waypoints?

        expect(result).to eq true
      end
    end

    context 'when the line has less than two waypoints' do
      it 'returns false' do
        line = Line.new('....')

        result = line.has_two_waypoints?

        expect(result).to eq false
      end
    end
  end

  describe '#first_waypoint_index' do
    it 'returns the index of the first waypoint in the line' do
      line = Line.new(".#.")

      index = line.first_waypoint_index

      expect(index).to eq 1
    end
  end

  describe '#last_waypoint_index' do
    it 'returns the index of the last waypoint in the line' do
      line = Line.new(".#..#")
    
      index = line.last_waypoint_index

      expect(index).to eq 4
    end
  end

  describe '#mark_path' do
    it 'returns the line with the path marker placed at the index' do
      line = Line.new('...')

      line.mark_path(1)

      expect(line.to_s).to eq '.*.'
    end

    it 'does not change # into *' do
      line = Line.new('#')

      line.mark_path(0)

      expect(line.to_s).to eq '#'
    end

    context 'when the ending index is set' do
      it 'changes the all characters from the starting index to the ending index to the path marker' do
        line = Line.new('.....')

        line.mark_path(1, 3)
        new_line = line.to_s

        expect(new_line).to eq '.***.'
      end
    end
  end
end