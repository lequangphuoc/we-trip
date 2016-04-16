require 'rails_helper'

RSpec.describe TripsController, type: :controller do
  let(:user) { create(:user) }
  let(:region) { create(:hcm) }

  before(:each) do
    allow(controller).to receive(:require_login)
    session[:user_id] = user.id
  end

  describe 'GET #edit' do
    let(:trip) { create(:trip1) }

    it 'should call requied login' do
      expect(controller).to receive(:require_login)
      get :edit, id: trip.id
    end

    it 'should render edit' do
      get :edit, id: trip.id
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST #create' do
    before(:each) do
      @trip_params = {title: 'title', expected_budget: 1000}
    end

    def post_to_controller(params)
      post :create, format: :js, trip: params
    end

    it 'should call requied login' do
      expect(controller).to receive(:require_login)
      post_to_controller(@trip_params)
    end

    it 'should create trip' do
      expect {
        post_to_controller(@trip_params)
      }.to change(Trip, :count).by(1)
      expect(assigns(:created)).to eq(true)
    end

    it 'should not create trip' do
      expect {
        post_to_controller({title: 'title'})
      }.to change(Trip, :count).by(0)
      expect(assigns(:created)).to eq(false)
    end

    it 'should create correct trip' do
      post_to_controller(@trip_params)
      trip = Trip.first
      expect(trip.title).to eq('title')
      expect(trip.expected_budget).to eq(1000)
    end

    it 'should render create' do
      post_to_controller(@trip_params)
      expect(response).to render_template(:create)
    end
  end

  describe 'PUT #update' do
    before(:each) do
      @trip = create(:trip1)
      @trip_params = attributes_for(:trip2)
      @trip_params.merge!({departure: region.name})
    end

    def put_to_controller(params)
      put :update, id: @trip.id, format: :js, trip: params
    end

    it 'should call requied login' do
      expect(controller).to receive(:require_login)
      put_to_controller(@trip_params)
    end

    it 'should update trip' do
      put_to_controller(@trip_params)
      expect(assigns(:updated)).to eq(true)
    end

    it 'should redirect to edit' do
      put_to_controller({title: 'title'})
      expect(assigns(:updated)).to eq(false)
    end

    it 'should render js' do
      put_to_controller(@trip_params)
      expect(response).to render_template(:update)
    end

    it 'should update correct trip' do
      put_to_controller(@trip_params)
      trip = Trip.first
      expect(trip.title).to eq('Trip 2')
      expect(trip.description).to eq('description')
      expect(trip.expected_budget).to eq(200000)
    end
  end
end
