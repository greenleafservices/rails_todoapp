class Todo < ApplicationRecord
 
 scope :sorted, lambda { order("name ASC") }
 
  validates :name, :presence => true 
  validates :description, :presence =>  true 
end
