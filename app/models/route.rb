class Route < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => {:scope => :user_id}
  validates :passengers, :presence => true, :numericality => {:only_integer => true, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 6}
  validates :source, :presence => true
  validates :destination, :presence => true
  validates :anticipation_id, :presence => true

  belongs_to :anticipation , :class_name => "Anticipation", :foreign_key => "anticipation_id"
  belongs_to :user
end
