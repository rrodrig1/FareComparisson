class Route < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => {:scope => :user_id}
  validates :passengers, :presence => true
  validates :source, :presence => true
  validates :destination, :presence => true
  validates :anticipation_id, :presence => true

  belongs_to :anticipation , :class_name => "Anticipation", :foreign_key => "anticipation_id"
end
