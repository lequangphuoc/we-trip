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

class UserBudget < ActiveRecord::Base
  belongs_to :budget_item
  belongs_to :user

  validates_presence_of :budget_item_id, :user_id
  validates_uniqueness_of :budget_item_id, scope: :user_id
end
