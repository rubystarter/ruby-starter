class Article < ActiveRecord::Base
  attr_accessible :content, :title, :topic_id, :user_id, :views

  validates :title, presence:true, uniqueness:true
  validates :content, presence:true

  belongs_to :topic

  belongs_to :user

  has_many :feedbacks

  has_many :votes
  
  def average_rating
  	get_average
  end

  def rating
  	find_rating
  end

  def get_average
  	Vote.where("article_id = ?", :id).average("rating")
  end

  def find_rating
    yourVote = Vote.where("article_id = ? and user_id = ?", :id, :user_id)
    if (yourVote.length>0)
    	@rating = yourVote.rating
    else
    	@rating = ""
    end
  end    

end
