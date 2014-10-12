require 'line'

describe Line do
  describe '#transform' do
    it "connects # with asteriks" do
      line = Line.new("#..#.")

      transformed_line = line.transform

      expect(transformed_line).to eq "#**#."
    end
  end
end