class User < ActiveRecord::Base
  attr_accessible :name, :email
  has_many :authorizations
  
  def add_provider(auth_hash)
    unless authorizations.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
      Authorization.create :user => self, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
    end
  end
  
  validates :name, :presence => true
end
