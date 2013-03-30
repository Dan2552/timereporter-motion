class TimeEntry < ModelSync::Base
  columns created_at: :datetime
  columns updated_at: :datetime
  columns entry_datetime: :datetime
  columns duration: :integer
  columns user_id: :integer
  columns project_id: :integer
  columns comment: :string
end
