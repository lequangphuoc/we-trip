# == Schema Information
#
# Table name: budget_items
#
#  id                :integer          not null, primary key
#  budget_section_id :integer
#  price             :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe BudgetItem, type: :model do
end
