# == Schema Information
#
# Table name: providers
#
#  id           :integer          not null, primary key
#  uid          :string
#  access_token :string
#  name         :string
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Provider < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :uid, :name, :access_token
end
