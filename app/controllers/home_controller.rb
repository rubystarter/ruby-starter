class HomeController < ApplicationController
  def index
  	@topics = Topic.all()
  	@recentArticles = Article.find(:all, :order => "updated_at  desc", :limit => 50)
  end
end
