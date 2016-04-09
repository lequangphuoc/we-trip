require 'rails_helper'

RSpec.describe CalculatePointsService do
	before(:each) do
		@user = create(:user)
    @service = CalculatePointsService.new(@user.id)
	end

	describe '#add_point' do
    it 'Adding points when viewed' do
      @service.add_point('view')
      expect(User.find(@user.id).point).to eq(1)
    end

    it 'Adding points when cloned' do
      @service.add_point('clone')
      expect(User.find(@user.id).point).to eq(5)
    end

    it 'Adding points when published' do
      @service.add_point('published')
      expect(User.find(@user.id).point).to eq(10)
    end

    it 'Adding points with empty type' do
      @service.add_point('')
      expect(User.find(@user.id).point).to eq(0)
    end

    it 'Adding points with other type' do
      @service.add_point('xxx')
      expect(User.find(@user.id).point).to eq(0)
    end
	end
end
