class TimeEntry < SyncModel::Base

  belongs_to :project
  belongs_to :user

  attribute :created_at, type: :date
  attribute :updated_at, type: :date
  attribute :time, type: :date #deprecates :entry_datetime
  attribute :minutes #deprecates :duration
  attribute :user_id
  attribute :project_id
  attribute :comment

  #TODO: validates minutes divisable by 15
  #TODO: validates time divisible by 15 minutes

  def self.for_date(date, duration=:week)
    where(time: Duration.new(duration).get_range(date))
  end

  def self.for(object)
    class_name = object.class.name.downcase
    where(:"#{class_name}_id" => object.id)
  end

end
