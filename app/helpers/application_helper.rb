module ApplicationHelper
  def title
    Detail.find_by_id(1).value
  end
  
  def isma
    Detail.find_by_id(2).value
  end
  
  def address
    Detail.find_by_id(7).value
  end
  
  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end
end