class Textbook < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  # Data validation
  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, presence: true, length: { minimum: 10 }, format: {with: /\A(\d+(-)*)+\Z/}
  validates :college, presence: true
  validates :email, presence: true
  validates :fblink, presence: true
  validates :price, presence: true

  # # Mapping
  # mapping do
  #   indexes :id, indexes: :not_analyzed
  #   indexes :title
  #   indexes :author
  #   indexes :isbn
  # end
  #
  # def as_indexed_json(options = {})
  #   self.as_json({only: [:id, :title, :author, :isbn],
  #     include: {
  #       #add users here
  #     }
  #   })
  # end
end
