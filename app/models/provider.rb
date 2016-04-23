class Provider < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :uid, :name, :access_token
end
