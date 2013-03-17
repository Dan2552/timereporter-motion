class User < ModelSync::Base
  columns email: :string
  columns password: :string
end
