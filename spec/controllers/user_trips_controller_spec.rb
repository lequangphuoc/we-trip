require 'rails_helper'

RSpec.describe UserTripsController, type: :controller do
  let(:user) { create(:user) }
  let(:trip) { create(:trip1) }

  describe 'POST #create' do
    before(:each) do
      allow(controller).to receive(:require_login)
    end

    it 'should require login' do
      expect(controller).to receive(:require_login)
      post :create, {tag: user.name, trip_id: trip.id}
    end

    it 'should create user_trip' do
      expect {
        post :create, {tag: user.name, trip_id: trip.id}
      }.to change(UserTrip, :count).by(1)
    end

    it 'should have right response' do
      post :create, {tag: user.name, trip_id: trip.id}
      @result = JSON.parse(response.body)
      expect(@result['success']).to eq(true)
      expect(@result['data']['user_id']).to eq(user.id)
    end
  end

  describe 'POST #destroy' do
    before(:each) do
      create(:user_trip, user: user, trip: trip)
      allow(controller).to receive(:require_login)
    end

    it 'should require login' do
      expect(controller).to receive(:require_login)
      delete :destroy, {tag: user.name, trip_id: trip.id}
    end

    it 'should create user_trip' do
      expect {
        delete :destroy, {tag: user.name, trip_id: trip.id}
      }.to change(UserTrip, :count).by(-1)
    end

    it 'should have right response' do
      delete :destroy, {tag: user.name, trip_id: trip.id}
      @result = JSON.parse(response.body)
      expect(@result['success']).to eq(true)
      expect(@result['data']['user_id']).to eq(user.id)
    end
  end
end
