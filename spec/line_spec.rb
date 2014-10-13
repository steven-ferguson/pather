require 'line'

describe Line do
  describe '#has_waypoint?' do
    context 'when the line a waypoint' do
      it 'returns true' do
        line = Line.new("..#")

        result = line.has_waypoint?

        expect(result).to eq true
      end
    end

    context 'when the line does not have a waypont' do
      it 'returns false' do
        line = Line.new("....")

        result = line.has_waypoint?

        expect(result).to eq false
      end
    end
  end

  describe '#waypoint_index' do
    it 'returns the index of the waypoint' do
      line = Line.new(".#.")

      index = line.waypoint_index

      expect(index).to eq 1
    end
  end

  describe '#mark_path' do
    it 'returns the line with the path marker placed at the index' do
      line = Line.new('...')

      line.mark_path(1)
      new_line = line.to_s

      expect(new_line).to eq '.*.'
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