require 'rspec'
require 'pather'

describe Pather do
  describe '#process' do
    it "writes a file that connects the # with asterisks" do
      expected_output = File.read('./spec/single_line_expected.txt')

      Pather.new(input_filename: 'single_line_fixture.txt', output_filename: 'result.txt').process

      actual_output = File.read('./spec/result.txt')
      expect(actual_output).to eq expected_output
    end
  end
end