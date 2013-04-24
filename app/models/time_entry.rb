class TimeEntry < ModelSync::Base
  columns created_at: :datetime
  columns updated_at: :datetime
  columns entry_datetime: :datetime
  columns duration: :integer
  columns user_id: :integer
  columns project_id: :integer
  columns comment: :string

  ALLOWED_DURATIONS = [:day, :week, :month, :year]

  def self.for_date(date, duration=:week)
    duration = :week unless duration.present?
    duration = :week unless ALLOWED_DURATIONS.include? duration.to_sym
    
    start_date = date.send("start_of_#{duration}").start_of_day
    end_date = (date.send("end_of_#{duration}") - 2).end_of_day

    where(entry_datetime: { between: start_date.to_i..end_date.to_i })
  end

  def duration_in_hours
    duration / 4
  end

  def date
    Date.parse(entry_datetime.to_s)
  end

  def start_time
    entry_datetime
  end

  def end_time
    start_time + duration_in_hours.hours 
  end
  
end
