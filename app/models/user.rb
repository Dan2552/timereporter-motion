class User < ModelSync::Base
  columns email: :string
  columns password: :string

  def self.login &after
    after = after || Proc.new {}
    User.delete_all
    User.get(action: :sign_in, priority: :auth) do
      user = User.first
      if user
        user.email = persisted_credentials[:email]
        user.password = persisted_credentials[:password]

        user.post(action: :sign_in, priority: :auth) do
          after.call logged_in?
        end

      else
        after.call logged_in?
      end
    end
  end

  def self.logged_in?
    (User.count == 1 && User.first.email.length > 0)
  end

  def self.persisted_credentials
    {
      email:     App::Persistence['username'],
      password:  App::Persistence['password']
    }
  end

  def self.persisted_credentials= params
    App::Persistence['username'] = params[:email]
    App::Persistence['password'] = params[:password]
  end
end
