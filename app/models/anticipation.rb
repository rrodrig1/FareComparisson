class Anticipation < ActiveRecord::Base
  validates :description, :presence => true, :uniqueness => true
  validates :advance, :presence => true

  has_many :routes
end
