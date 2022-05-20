# frozen_string_literal: true

RSpec.describe Payroll::Report do
  let(:timelogs) do
    [
      {
        "date"=>"04/01/2021",
        "shiftType"=>"A",
        "rate"=>"45",
        "department"=>"A&E",
        "worker"=>"John",
        "startTime"=>"09:00",
        "endTime"=>"15:00"},
      {
        "date"=>"04/01/2021",
        "shiftType"=>"B",
        "rate"=>"45",
        "department"=>"A&E",
        "worker"=>"Jane",
        "startTime"=>"20:00",
        "endTime"=>"08:00"
      }
    ]
  end

  subject(:report) { described_class.new(timelogs) }

  describe '#time_per_staff' do
    it 'returns total time per staff' do
      expect(report.time_per_staff).to eql([{:worker=>"John", :duration=>6}, {:worker=>"Jane", :duration=>12}])
    end
  end

  describe '#time_per_department' do
    it 'return total time per departiment' do
      expect(report.time_per_department).to eql([{:department=>"A&E", :duration=>18}])
    end
  end

  describe '#amount_per_staff' do
    it 'returns amount per staff' do
      expect(report.amount_per_staff).to eql([{:worker=>"John", :amount=>270}, {:worker=>"Jane", :amount=>540}])
    end
  end

  describe '#amount_per_department' do
    it 'returns amount per department' do
      expect(report.amount_per_department).to eql([{:department=>"A&E", :amount=>810}])
    end
  end
end
