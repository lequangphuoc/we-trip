class BudgetSection < ActiveRecord::Base
  belongs_to :trip, dependent: :destroy

  validates_presence_of :title, :trip_id
end
