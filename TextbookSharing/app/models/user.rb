class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :textbooks

  # # Data validation
  #validates :name, presence: true
  #validates :college, presence: true
  #validates :fblink, presence: true
  #validates :fblink, format: { with: /https:\/\/www.facebook.com(.*)/, message: "invalid facebook link" }

  COLLEGES = ['CGU', 'CMC', 'HMC', 'KGI', 'POM', 'PTZ', 'SCR']

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.fblink = auth.info.urls["Facebook"]
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
    end
  end
end
