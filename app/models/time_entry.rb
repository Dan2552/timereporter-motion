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

  def self.for_date(date, duration=:week)
    where(entry_datetime: Duration.new(duration).get_range(date))
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
