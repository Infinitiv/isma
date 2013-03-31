module ApplicationHelper
  def details
    details = {}
    Detail.all.each do |d|
      details[d.key] = d.value
    end
    details
  end

  
  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end
  
  def current_user_writer?
    current_user.groups.where(writer: true).count > 0 unless current_user.nil?
  end
  
  def current_user_moderator?
    current_user.groups.where(moderator: true).count > 0 unless current_user.nil?
  end

  def current_user_commentator?
    current_user.groups.where(commentator: true).count > 0 unless current_user.nil?
  end

  def current_user_administrator?
    current_user.groups.where(administrator: true).count > 0 unless current_user.nil?
  end
end