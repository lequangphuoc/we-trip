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

require 'rails_helper'

RSpec.describe BudgetSection, type: :model do
end
