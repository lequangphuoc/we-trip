class CalculatePointsService
  def initialize(user_id)
    @user = User.find(user_id)
  end

  def add_point(type)
    case type
      when 'view'
        @user.increment!(:point)
      when 'clone'
        @user.increment!(:point, by = 5)
      when 'published'
        @user.increment!(:point, by = 10)
      else
        return
    end
  end
end

