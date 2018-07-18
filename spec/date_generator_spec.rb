require 'date_generator'

describe DateGenerator do

  context '#get_time' do
    it 'generate a date and time' do
      date_generator = DateGenerator.new
      allow(Time).to receive(:now).and_return("2018-07-17 14:41:01")
      expect(date_generator.get_time).to eq("2018-07-17 14:41:01")
    end
  end

  context '#print_date' do
    it 'prints date and time' do
      date_generator = DateGenerator.new
      allow(Time).to receive(:now).and_return(Time.parse("18/07/2018 10:14"))
      expect(date_generator.print_date).to eq("18/07/2018 10:14")
    end
  end
end
