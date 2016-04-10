class FriendRelationsService
  def initialize(current_user, target_id)
    @current_user = current_user
    @target_id = target_id
  end

  def create
    @current_user.friend_relations.create(target_id: @target_id)
  end

  def confirm
    @current_user.friend_relations.create(target_id: @target_id, status: 'accepted')
    find_sender_relation.update_attributes(status: 'accepted')
  end

  def reject
    find_sender_relation.destroy
  end

  private
  def find_sender_relation
    FriendRelation.find_by(target_id: @current_user.id, user_id: @target_id)
  end
end