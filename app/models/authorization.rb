class Authorization < ActiveRecord::Base
  belongs_to :user
  
  validates :provider, :uid, :uname, :presence => true
end
