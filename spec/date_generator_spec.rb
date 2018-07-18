require 'date_generator'

describe DateGenerator do

  context '#get_time' do
    it 'generate a date and time' do
      date_generator = DateGenerator.new
      allow(Time).to receive(:now).and_return("2018-07-17 14:41:01")
      expect(date_generator.get_time).to eq("2018-07-17 14:41:01")
    end
  end
end
