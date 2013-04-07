class UserController < UIViewController
  extend IB

  outlet :username_field
  outlet :password_field

  def viewDidAppear(animated)
    super
    load_persisted_credentials
    segue_to_time_entries if User.logged_in?
  end

  def login(sender)
    save_persisted_credentials
    User.login do |success|
      if success
        segue_to_time_entries
      else
        App.alert("Failed to authenticate. Check your internet connection and try again.")
      end
    end
  end

  private

  def load_persisted_credentials
    params = User.persisted_credentials
    username_field.text = params[:email]
    password_field.text = params[:password]
  end

  def save_persisted_credentials
    params = {
      email:     username_field.text,
      password:  password_field.text
    }
    User.persisted_credentials = params
  end

  def segue_to_time_entries
    performSegueWithIdentifier("time_entries", sender:self)
  end

end
