module ArticlesHelper
  def get_user_name(id)
    find_user = User.where("id = ?", id)
    if (find_user.length>0)
      if find_user.first.name.nil?
      	""
      else
      	find_user.first.name
      end
    else
      ""
    end
  end	
end
