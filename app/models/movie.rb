class Movie < ActiveRecord::Base
  has_attached_file :poster, :styles => { :large => "640x280", :medium => "320x140" }
  validates :name, :released, :presence => true
  
end
