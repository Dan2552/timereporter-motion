class Hello
  include MotionModel::Model
  include MotionModel::FMDBModelAdapter
  
  columns name: :string
  columns created_at: :datetime
  columns updated_at: :datetime

end
