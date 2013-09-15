class TimeEntry < SyncModel::Base

  belongs_to :project
  belongs_to :user

  attribute :created_at
  attribute :updated_at
  attribute :entry_datetime
  attribute :duration
  attribute :user_id
  attribute :project_id
  attribute :comment

  ALLOWED_DURATIONS = [:day, :week, :month, :year]

  def self.for_date(date, duration=:week)
    duration = :week unless duration.present?
    duration = :week unless ALLOWED_DURATIONS.include? duration.to_sym

    start_date = date.send("start_of_#{duration}").beginning_of_day
    end_date = date.send("end_of_#{duration}").end_of_day

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
