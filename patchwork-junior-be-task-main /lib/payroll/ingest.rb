# frozen_string_literal: true
require 'csv'

module Payroll
  class Ingest
    def initialize
      @shift_details = CSV.open('./data/shiftdetails.csv', headers: :first_row).map(&:to_h)
      @timesheet = CSV.open('./data/timesheet.csv', headers: :first_row).map(&:to_h)
    end

    def timelogs
      @timesheet.map do |ts|
        shift_detail = @shift_details.find { |sd| sd['shiftType'] == ts['shiftType'] } || {}
        ts.merge(shift_detail)
      end
    end
  end
end
