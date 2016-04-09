require 'rails_helper'

RSpec.describe CalculatePointsService do
	before(:each) do
		@user = create(:user)
	end

	it "Adding points when viewed" do
		CalculatePointsService.new(@user.id, "view")
		expect(User.find(@user.id).point).to eq(1)
	end


	it "Adding points when cloned" do
		CalculatePointsService.new(@user.id, "clone")
		expect(User.find(@user.id).point).to eq(5)
	end

	it "Adding points when published" do
		CalculatePointsService.new(@user.id, "published")
		expect(User.find(@user.id).point).to eq(10)
	end

	it "Adding points with empty type" do
		CalculatePointsService.new(@user.id, "")
		expect(User.find(@user.id).point).to eq(0)
	end
end
