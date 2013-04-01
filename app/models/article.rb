class Article < ActiveRecord::Base
  attr_accessible :content, :title, :topic_id, :user_id

  validates :title, presence:true, uniqueness:true
  validates :content, presence:true

  belongs_to :topic

  belongs_to :user

  has_many :feedbacks

  has_many :votes
  
end
