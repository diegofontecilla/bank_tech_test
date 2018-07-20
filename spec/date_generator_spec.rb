require 'date_generator'

describe DateGenerator do
  subject(:date_generator) { described_class.new }

  context '#format_date' do
    it 'give an output format to date and time' do
      allow(Time).to receive(:now).and_return(Time.parse('18/07/2018'))
      expect(date_generator.format_date).to eq('18/07/2018')
    end
  end
end
