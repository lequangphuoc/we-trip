class Budget < ActiveRecord::Base
  belongs_to :budget_section, dependent: :destroy
  belongs_to :attraction, dependent: :destroy

  validates_presence_of :attraction_id, :budget_section_id
  validates_numericality_of :price
end
