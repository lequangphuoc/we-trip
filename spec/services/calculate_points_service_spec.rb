require 'rails_helper'

RSpec.describe CalculatePointsService do
	before(:each) do
		@user = create(:user)
    trip = double(Trip)
    allow(trip).to receive(:users).and_return([@user])
    @service = CalculatePointsService.new(trip)
	end

	describe '#add_point' do
    it 'Adding points when viewed' do
      @service.add_point_by_trip('view')
      expect(User.find(@user.id).point).to eq(1)
    end

    it 'Adding points when cloned' do
      @service.add_point_by_trip('clone')
      expect(User.find(@user.id).point).to eq(5)
    end

    it 'Adding points when published' do
      @service.add_point_by_trip('published')
      expect(User.find(@user.id).point).to eq(10)
    end

    it 'Adding points with empty type' do
      @service.add_point_by_trip('')
      expect(User.find(@user.id).point).to eq(0)
    end

    it 'Adding points with other type' do
      @service.add_point_by_trip('xxx')
      expect(User.find(@user.id).point).to eq(0)
    end
	end
end
