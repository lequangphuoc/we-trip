# == Schema Information
#
# Table name: budget_items
#
#  id                :integer          not null, primary key
#  budget_section_id :integer
#  price             :integer
#  name              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class BudgetItem < ActiveRecord::Base
  belongs_to :budget_section
  has_many :user_budgets, dependent: :destroy

  validates_presence_of :budget_section_id, :name
  validates_numericality_of :price, only_integer: true
end
