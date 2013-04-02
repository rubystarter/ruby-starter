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

  def find_rating(article)
    yourVote = Vote.where("article_id = ? and user_id = ?", article.id, article.user_id)
    if (yourVote.length>0)
    	@rating = yourVote.rating
    else
    	@rating = ""
    end
  end     

  def get_article_average(id)
  	average = Vote.where("article_id = ?", id).average("rating")
  	if (average.nil?)
  		""
  	else
  		"%0.2f" % average
  	end
  end  

  def views_increase(article)
      if (article.views.nil?)
        views = 1
      else
        views = article.views + 1
      end
  end 
    
end
