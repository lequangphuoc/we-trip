require 'rails_helper'

RSpec.describe FriendRelationsController, type: :controller do
  before(:each) do
    @user = create(:user)
    @friend_relation = double(FriendRelation)
    session[:user_id] = @user.id
  end

  describe 'POST #create' do
    before(:each) do
      allow(controller).to receive(:require_login)
      allow_any_instance_of(FriendRelationsService).to receive(:create).and_return(@friend_relation)
    end

    it 'should call require_login' do
      expect(controller).to receive(:require_login)
      post :create, target_id: 2, format: :js
    end

    it 'should call create service' do
      post :create, target_id: 2, format: :js
      expect(assigns(:friend_relation)).to eq(@friend_relation)
    end
  end

  describe 'POST #confirm' do
    before(:each) do
      allow(controller).to receive(:require_login)
      allow_any_instance_of(FriendRelationsService).to receive(:confirm).and_return(@friend_relation)
    end

    it 'should call require_login' do
      expect(controller).to receive(:require_login)
      post :confirm, target_id: 2, format: :js
    end

    it 'should call confirm service' do
      post :confirm, target_id: 2, format: :js
      expect(assigns(:friend_relation)).to eq(@friend_relation)
    end
  end

  describe 'POST #reject' do
    before(:each) do
      allow(controller).to receive(:require_login)
      allow_any_instance_of(FriendRelationsService).to receive(:reject).and_return(true)
    end

    it 'should call require_login' do
      expect(controller).to receive(:require_login)
      post :reject, target_id: 2, format: :js
    end

    it 'should call reject service' do
      post :reject, target_id: 2, format: :js
      expect(assigns(:success)).to eq(true)
    end
  end
end
