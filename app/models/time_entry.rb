class TimeEntry < ModelSync::Base
  columns created_at: :datetime
  columns updated_at: :datetime
  columns entry_datetime: :datetime
  columns duration: :integer
  columns user_id: :integer
  columns project_id: :integer
  columns comment: :string

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
