require 'rails_helper'

RSpec.describe Attachment, type: :model do
  it { should validate_presence_of(:trip_id) }
  it { should validate_presence_of(:path) }
  it { should belong_to(:trip).dependent(:destroy) }
end
