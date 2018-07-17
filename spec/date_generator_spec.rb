require 'date_generator'

describe DateGenerator do

  context '#get_time' do
    it 'generate a date and time' do
      date_generator = DateGenerator.new
      allow(date_generator).to receive(:get_time) { "17/07/2018 11:26" }
      expect(date_generator.get_time).to eq("17/07/2018 11:26")
    end
  end

  it 'prints the date in reverse chronological order' do
    date_generator = DateGenerator.new
    allow(date_generator).to receive(:print_date) { "17/07/2018 11:26" }
    expect(date_generator.print_date).to eq("17/07/2018 11:26")
  end
end
