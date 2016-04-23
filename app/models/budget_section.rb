# == Schema Information
#
# Table name: budget_sections
#
#  id              :integer          not null, primary key
#  schedule_day_id :integer
#  trip_id         :integer
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class BudgetSection < ActiveRecord::Base
  belongs_to :schedule_day
  belongs_to :trip
  has_many :budget_items, dependent: :destroy
end
