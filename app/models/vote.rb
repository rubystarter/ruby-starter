class Vote < ActiveRecord::Base
  attr_accessible :rating, :user_id, :article_id

  belongs_to :user
  belongs_to :article  
end

