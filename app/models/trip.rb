# == Schema Information
#
# Table name: trips
#
#  id              :integer          not null, primary key
#  start_date      :datetime
#  departure_id    :integer
#  title           :string
#  description     :text
#  expected_budget :decimal(, )
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Trip < ActiveRecord::Base
  has_many :user_trips
  has_many :users, through: :user_trips
  has_one :departure, class_name: Region, foreign_key: :departure_id

  validates_presence_of :expected_budget, :title
  validates_numericality_of :expected_budget
end
