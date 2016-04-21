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

require 'rails_helper'

RSpec.describe Trip, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:departure_id).on(:update) }
  it { should validate_presence_of(:description).on(:update) }
  it { should validate_presence_of(:start_date).on(:update) }
  it { should validate_numericality_of(:expected_budget) }
  it { should have_many(:user_trips) }
  it { should have_many(:users).through(:user_trips) }
  it { should have_many(:user_trips) }
  it { should respond_to(:departure_id) }
  it { should respond_to(:start_date) }
  it { should respond_to(:description) }
  it { should have_many(:schedule_days) }
  it { should have_many(:attractions).through(:schedule_days) }
  it { should belong_to(:departure).class_name(Region).with_foreign_key(:departure_id) }
end
