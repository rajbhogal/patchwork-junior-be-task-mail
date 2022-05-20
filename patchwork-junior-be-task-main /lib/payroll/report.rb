# frozen_string_literal: true

module Payroll
  class Report
    # Task 2 - Generate a report
    def initialize(timelogs)
      @timelogs = timelogs
      @staffs = timelogs.map { |timelog| timelog['worker'] }.uniq
      @departments = timelogs.map { |timelog| timelog['department'] }.uniq
    end

    def time_per_staff
      @staffs.map do |staff|
        staff_timelogs = @timelogs.select { |timelog| timelog['worker'] == staff }
        { worker: staff , duration: calculate_time(staff_timelogs) }
      end
    end

    def time_per_department
      @departments.map do |department|
        department_timelogs = @timelogs.select { |timelog| timelog['department'] == department }
        { department: department , duration: calculate_time(department_timelogs) }
      end
    end

    def amount_per_staff
      @staffs.map do |staff|
        staff_timelogs = @timelogs.select { |timelog| timelog['worker'] == staff }
        { worker: staff , amount: calculate_amount(staff_timelogs) }
      end
    end

    def amount_per_department
      @departments.map do |department|
        department_timelogs = @timelogs.select { |timelog| timelog['department'] == department }
        { department: department , amount: calculate_amount(department_timelogs) }
      end
    end

    def calculate_time(timelogs)
      total_time = 0
      timelogs.each do |timelog|
        st = timelog['startTime']&.to_i
        et = timelog['endTime']&.to_i
        total_time += duration(st, et)
      end
      total_time
    end

    def calculate_amount(timelogs)
      timelogs.map { |timelog| timelog['rate'].to_i * duration(timelog['startTime']&.to_i, timelog['endTime']&.to_i) }.sum
    end

    def duration(starttime, endtime)
      endtime > starttime ? endtime - starttime : endtime + 24 - starttime
    end
  end
end
