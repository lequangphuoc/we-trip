# == Schema Information
#
# Table name: attachments
#
#  id         :integer          not null, primary key
#  path       :string
#  trip_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Attachment, type: :model do
  it { should validate_presence_of(:trip_id) }
  it { should validate_presence_of(:path) }
  it { should belong_to(:trip) }
end
