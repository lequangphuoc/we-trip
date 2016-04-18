require 'rails_helper'

RSpec.describe BudgetSection, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:trip_id) }
  it { should belong_to(:trip).dependent(:destroy) }
end
