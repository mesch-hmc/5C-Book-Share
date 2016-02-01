class Textbook < ActiveRecord::Base
  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, presence: true, length: { minimum: 10 }, format: {with: /\A(\d+(-)*)+\Z/}
  validates :college, presence: true
  validates :email, presence: true
  validates :fblink, presence: true
  validates :price, presence: true
end
