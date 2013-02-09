module ApplicationHelper
  def title
    Detail.find_by_id(1).value
  end
  
  def isma
    Detail.find_by_id(2).value
  end
  
  def divisions
    Division.all
  end
  
  def users
    User.all
  end
end
