require 'rails_helper'

RSpec.describe Budget, type: :model do
  it { should belong_to(:budget_section).dependent(:destroy) }
  it { should belong_to(:attraction).dependent(:destroy) }
  it { should validate_presence_of(:attraction_id) }
  it { should validate_presence_of(:budget_section_id) }
  it { should validate_numericality_of(:price) }
end
