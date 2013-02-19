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
end