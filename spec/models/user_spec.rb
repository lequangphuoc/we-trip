# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  description     :text
#  point           :integer          default("0")
#  avatar          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_length_of(:password).is_at_least(8) }
  it { should respond_to(:password_confirmation) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:point) }
  it { should have_secure_password }
  it { should respond_to(:avatar) }
  it { should respond_to(:avatar_url) }
  it { should respond_to(:remote_avatar_url) }
  it { should_not allow_value('test@test').for(:email) }
  it { should_not allow_value('android').for(:email) }
  it { should_not allow_value('ios.@..c').for(:email) }
  it { should allow_value('vuhuyquan@apidez.com').for(:email) }
  it { should validate_numericality_of(:point).only_integer }
  it { should validate_numericality_of(:point).is_greater_than_or_equal_to(0) }
end
