class Todo < ActiveRecord::Base
  belongs_to :trip, dependent: :destroy
  belongs_to :user, dependent: :destroy

  validates_presence_of :trip_id, :user_id, :title, :description
end
