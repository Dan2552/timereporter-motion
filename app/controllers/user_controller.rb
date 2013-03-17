class UserController < UIViewController
  extend IB

  outlet :username_field
  outlet :password_field

  def viewDidAppear(animated)
    super
    load_persisted_credentials

    if is_logged_in?
      segue_to_time_entries
    else
      User.delete_all
      User.get(:sign_in)
    end
  end

  def login(sender)
    save_persisted_credentials

    user = User.first
    if user
      user.email = username_field.text
      user.password = password_field.text

      user.post(:sign_in)
    else
      App.alert("Something went wrong :(")
    end
  end

  private

  def load_persisted_credentials
    username_field.text = App::Persistence['username']
    password_field.text = App::Persistence['password']
  end

  def save_persisted_credentials
    App::Persistence['username'] = username_field.text
    App::Persistence['password'] = password_field.text
  end

  def is_logged_in?
    (User.count == 1 && User.first.email.length > 0)
  end

  def segue_to_time_entries
    performSegueWithIdentifier("time_entries", sender:self)
  end

end
