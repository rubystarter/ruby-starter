module ArticlesHelper
  def get_user_name(id)
    article_user = User.where("id = ?", id)
    if (article_user.length>0)
      article_user.first.name
    else
      ""
    end
  end	
end
