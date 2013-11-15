class ApiKey < ActiveRecord::Base

  belongs_to :user
  validates :user, presence: true
  accepts_nested_attributes_for :user

  before_create :generate_access_token

  def self.valid? token
    find_by_access_token(token).present?
  end

  private

  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end

end
