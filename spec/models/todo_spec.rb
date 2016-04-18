require 'rails_helper'

RSpec.describe Todo, type: :model do
  it { should belong_to(:trip).dependent(:destroy) }
  it { should belong_to(:user).dependent(:destroy) }
  it { should validate_presence_of(:trip_id) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
end
