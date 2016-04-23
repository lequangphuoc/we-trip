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
#  is_published    :boolean          default("false")
#

class Trip < ActiveRecord::Base
  has_many :user_trips
  has_many :schedule_days
  has_many :users, through: :user_trips
  has_many :attractions, through: :schedule_days
  belongs_to :departure, class_name: Region, foreign_key: :departure_id
  has_many :budget_sections, dependent: :destroy
  has_many :budget_items, through: :budget_sections
  has_many :user_budgets, through: :budget_items
  has_many :attachments, dependent: :destroy

  validates_presence_of :title
  validates_numericality_of :expected_budget
  validates_presence_of :departure_id, :description, :start_date, on: :update

  after_create :create_default_schedule_day

  def create_default_schedule_day
    self.schedule_days.create(index: 1)
    self.budget_sections.create(title: 'Pre-trip')
  end

  def total_money
    self.budget_sections.reduce(0) { |total_money, budget_section| total_money + budget_section.total }
  end

  def users_except_current(current_user_id)
    User.where('id IN (?) AND id != (?)', self.users.pluck(:id), current_user_id)
  end

  def list_of_attractions
    Attraction.where(schedule_day_id: schedule_day_ids)
  end
end
