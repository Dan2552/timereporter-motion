class BaseViewController < UIViewController

  def self.from_storyboard(storyboard_name="Storyboard")
    storyboard = UIStoryboard.storyboardWithName(storyboard_name, bundle:nil)
    storyboard.instantiateViewControllerWithIdentifier(self.name)
  end

end
