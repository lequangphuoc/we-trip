require 'rails_helper'

RSpec.describe FriendRelationsService do
  let(:friend_relation) { create(:friend_relation) }
  let(:user) { create(:user) }
  let(:target) { create(:target) }

  before(:each) do
    @service = FriendRelationsService.new(user, target.id)
  end

  describe '#create' do
    before(:each) do
      @service.create
    end

    it 'should create relation' do
      expect(user.friend_relations.count).to eq(1)
    end

    it 'should have correct target id' do
      expect(user.friend_relations.first.target_id).to eq(target.id)
    end

    it 'should have status pending' do
      expect(user.friend_relations.first.status).to eq('pending')
    end
  end

  describe '#confirm' do
    before(:each) do
      FriendRelation.create(user_id: target.id, target_id: user.id)
      @notification = Notification.create(name: "Friend Request", description: "I want to be your friend.", category: "request")
      UserNotification.create(sender_id: target.id, user_id: user.id, notification_id: @notification.id)

      @service.confirm
    end

    it 'should create relation' do
      expect(FriendRelation.count).to eq(2)
    end

    it 'should have correct relation' do
      expect(user.friend_relations.first.target_id).to eq(target.id)
    end

    it 'should have correct status' do
      expect(FriendRelation.first.status).to eq('accepted')
      expect(FriendRelation.second.status).to eq('accepted')
    end
  end

  describe '#reject' do
    before(:each) do
      FriendRelation.create(user_id: target.id, target_id: user.id)
      @notification = Notification.create(name: "Friend Request", description: "I want to be your friend.", category: "request")
      UserNotification.create(sender_id: target.id, user_id: user.id, notification_id: @notification.id)

      @service.reject
    end

    it 'should destroy relation' do
      expect(FriendRelation.count).to eq(0)
    end

    it 'should destroy relation' do
      expect(user.friend_relations.count).to eq(0)
      expect(target.friend_relations.count).to eq(0)
    end
  end
end
