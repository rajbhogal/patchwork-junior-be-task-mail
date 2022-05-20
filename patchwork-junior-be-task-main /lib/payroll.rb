# frozen_string_literal: true

require_relative './payroll/ingest'
require_relative './payroll/report'
require_relative './payroll/version'

module Payroll
  # Task 3 - Wrap it all up
  timelogs = Payroll::Ingest.new.timelogs
  report = Payroll::Report.new(timelogs)
  formatted_report = {
    staff_work_duration: report.time_per_staff,
    department_work_duration: report.time_per_department,
    staff_payroll_amount: report.amount_per_staff,
    department_payroll_amount: report.amount_per_department
  }
  puts formatted_report
  formatted_report
end
