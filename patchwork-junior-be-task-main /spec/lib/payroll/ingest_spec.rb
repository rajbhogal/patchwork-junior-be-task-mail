# frozen_string_literal: true

RSpec.describe Payroll::Ingest do
  subject(:ingest) { described_class.new }

  describe '#timelogs' do
    let(:output) do
      [{"date"=>"04/01/2021",
        "shiftType"=>"A",
        "rate"=>"45",
        "department"=>"G&E",
        "worker"=>"John",
        "startTime"=>"09:00",
        "endTime"=>"15:00"},
       {"date"=>"04/01/2021",
        "shiftType"=>"B",
        "rate"=>"45",
        "department"=>"A&E",
        "worker"=>"Jane",
        "startTime"=>"20:00",
        "endTime"=>"08:00"},
       {"date"=>"05/01/2021",
        "shiftType"=>"A",
        "rate"=>"60",
        "department"=>"A&E",
        "worker"=>"John",
        "startTime"=>"09:00",
        "endTime"=>"15:00"},
       {"date"=>"06/01/2021",
        "shiftType"=>"B",
        "rate"=>"45",
        "department"=>"A&E",
        "worker"=>"Jane",
        "startTime"=>"20:00",
        "endTime"=>"08:00"},
       {"date"=>"06/01/2021",
        "shiftType"=>"A",
        "rate"=>"45",
        "department"=>"G&E",
        "worker"=>"John",
        "startTime"=>"09:00",
        "endTime"=>"15:00"},
       {"date"=>"07/01/2021",
        "shiftType"=>"A",
        "rate"=>"60",
        "department"=>"A&E",
        "worker"=>"Jane",
        "startTime"=>"09:00",
        "endTime"=>"15:00"},
       {"date"=>"08/01/2021",
        "shiftType"=>"B",
        "rate"=>"45",
        "department"=>"G&E",
        "worker"=>"John",
        "startTime"=>"20:00",
        "endTime"=>"08:00"},
       {"date"=>"09/01/2021",
        "shiftType"=>"A",
        "rate"=>"60",
        "department"=>"G&E",
        "worker"=>"Jane",
        "startTime"=>"09:00",
        "endTime"=>"15:00"},
       {"date"=>"10/01/2021",
        "shiftType"=>"B",
        "rate"=>"45",
        "department"=>"G&E",
        "worker"=>"John",
        "startTime"=>"20:00",
        "endTime"=>"08:00"}
      ]
    end
    it 'returns merged data of shiftdetail and timesheet' do
      expect(ingest.timelogs).to eq output
    end
  end
  # Add your specs for Task 1 here
end
