# == Schema Information
#
# Table name: places
#
#  id             :integer          not null, primary key
#  name           :string
#  location_id    :string
#  rating         :decimal(, )
#  latitude       :decimal(, )
#  longitude      :decimal(, )
#  vicinity       :string
#  description    :text
#  region_id      :integer
#  default_budget :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Place, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
