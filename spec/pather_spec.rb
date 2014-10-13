require 'rspec'
require 'pather'

describe Pather do
  describe '#process' do
    it "writes a file that connects the # with asterisks" do
      expected_output = File.read('./spec/expected_output.txt')

      Pather.new(input_filename: 'spec/fixture.txt', output_filename: 'spec/result.txt').process

      actual_output = File.read('./spec/result.txt')
      expect(actual_output).to eq expected_output
    end
  end

  describe '#process_line' do
    context 'when the starting waypoint has not been found' do
      it 'returns the line' do
        line = Line.new('....')

        new_line = Pather.new(input_filename: 'test', output_filename: 'test').process_line(line)
        
        expect(new_line).to eq '....'
      end

      context 'when the line has the starting waypoint' do
        it 'sets the starting waypoint index for the path and returns the line' do
          line = Line.new('...#')
          pather = Pather.new(input_filename: 'test', output_filename: 'test')

          new_line = pather.process_line(line)
          starting_location = pather.starting_waypoint_index

          expect(starting_location).to eq 3
          expect(new_line).to eq '...#'
        end
      end
    end

    context 'when the line is between the waypoints' do
      it 'changes the character at index of the starting waypoint to *' do
        line = Line.new("....")
        pather = Pather.new(input_filename: 'test', output_filename: 'test')
        pather.set_starting_waypoint(1)

        new_line = pather.process_line(line)

        expect(new_line).to eq ".*.."
      end 
    end

    context 'when the line has the ending waypoint' do
      it 'marks the path between the starting waypoint index and ending waypoint with *s' do
        line = Line.new("...#.")
        pather = Pather.new(input_filename: 'test', output_filename: 'test')
        pather.set_starting_waypoint(1)

        new_line = pather.process_line(line)

        expect(new_line).to eq ".**#."
      end
    end

    context 'when the line has both the starting and ending waypoints' do
      it 'marks the path between the two waypoints' do
        line = Line.new(".#...#")
        pather = Pather.new(input_filename: 'test', output_filename: 'test')
        
        new_line = pather.process_line(line)

        expect(new_line).to eq '.#***#'
      end
    end

    context 'when the line is below the ending waypoint' do
      it 'returns the line' do
        line = Line.new("....")
        pather = Pather.new(input_filename: 'test', output_filename: 'test')
        pather.set_starting_waypoint(1)
        pather.set_ending_waypoint(2)

        new_line = pather.process_line(line)

        expect(new_line).to eq "...."
      end
    end
  end
end