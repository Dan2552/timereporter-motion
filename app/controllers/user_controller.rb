class UserController < UIViewController
  extend IB

  outlet :username_field
  outlet :password_field

  def viewDidAppear(animated)
    super
    load_persisted_credentials

    logged_in_before = check_has_logged_in_before?
    
    User.delete_all
    User.get(:sign_in) do |fetched|
      send_login if logged_in_before
    end
  end

  def login(sender)
    save_persisted_credentials

    if User.first
      send_login
    else
      App.alert("Something went wrong :(")
    end
  end

  private

  def send_login
    user = User.first
    user.email = username_field.text
    user.password = password_field.text
    user.post(:sign_in) do |success|
      if success
        segue_to_time_entries
      else
        App.alert("Something went wrong :(")
      end
    end
  end

  def load_persisted_credentials
    username_field.text = App::Persistence['username']
    password_field.text = App::Persistence['password']
  end

  def save_persisted_credentials
    App::Persistence['username'] = username_field.text
    App::Persistence['password'] = password_field.text
  end

  def check_has_logged_in_before?
    (User.count == 1 && User.first.email.length > 0)
  end

  def segue_to_time_entries
    performSegueWithIdentifier("time_entries", sender:self)
  end

end
