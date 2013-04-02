class Article < ActiveRecord::Base
  attr_accessible :content, :title, :topic_id, :user_id

  validates :title, presence:true, uniqueness:true
  validates :content, presence:true

  belongs_to :topic

  belongs_to :user

  has_many :feedbacks

  has_many :votes
  
  attr_accessor :average, :rating

  def initialize
  end

  def average_rating
  	@average
  end

  def rating
  	@rating
  end

  def get_average
  	@average = Vote.where("article_id = ?", :id).average("rating")
  end

  def find_rating
    yourVote = Vote.where("article_id = ? and user_id = ?", :id, :user_id).first
    if (yourVote.nil?)
    	@rating = 0
    else
    	@rating = yourVote.rating
    end
  end    
end
