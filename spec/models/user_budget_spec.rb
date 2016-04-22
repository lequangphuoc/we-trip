# == Schema Information
#
# Table name: user_budgets
#
#  id             :integer          not null, primary key
#  budget_item_id :integer
#  user_id        :integer
#  price          :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  kind           :string
#

require 'rails_helper'

RSpec.describe UserBudget, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:budget_item) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:budget_item_id) }
end
