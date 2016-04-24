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

require 'rails_helper'

RSpec.describe Provider, type: :model do
end
