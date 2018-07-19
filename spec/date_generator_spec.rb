require 'date_generator'

describe DateGenerator do

  context '#format_date' do
    it 'give an output format to date and time' do
      date_generator = DateGenerator.new
      allow(Time).to receive(:now).and_return(Time.parse("18/07/2018 10:14"))
      expect(date_generator.format_date).to eq("18/07/2018 10:14")
    end
  end
end
