# == Schema Information
#
# Table name: trips
#
#  id              :integer          not null, primary key
#  start_date      :datetime
#  end_date        :datetime
#  title           :string
#  description     :text
#  expected_budget :decimal(, )
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Trip < ActiveRecord::Base
  has_many :user_trips
  has_many :users, through: :user_trips

  validates_presence_of :start_date, :end_date, :title, :description
  validates :expected_budget, numericality: true, presence: true
end
