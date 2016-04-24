# == Schema Information
#
# Table name: notifications
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  category    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Notification, type: :model do
end
