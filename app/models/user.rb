class User < ActiveRecord::Base
  #has_many :events, class_name: "::FullcalendarEngine::Event", foreign_key: "user_id", dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :event_series, dependent: :destroy
  
  acts_as_authentic do |c|
    # c.login_field = 'email'
    c.crypto_provider = Authlogic::CryptoProviders::BCrypt
    c.validates_length_of_email_field_options = { :within => 3..30 }
    c.validates_length_of_password_field_options = { :within => 6..30 }
    c.validates_uniqueness_of_email_field_options = { :uniqueness => true }
  end

  validates :email, :password, :password_confirmation, :presence => true
  
  def title_with_email
    title.present? ? "#{title} (#{email})" : email
  end
end
