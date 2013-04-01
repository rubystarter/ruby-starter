class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :user_type

  has_many :articles

  has_many :votes
  has_many :voted_articles, through: :votes, source: :article

  def has_votes?(article)
    voted_articles.include?(article)
  end

  def vote_for(article)
    votes.where(article_id, article.id)
  end
end
