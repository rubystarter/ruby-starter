class Feedback < ActiveRecord::Base
  attr_accessible :author, :notes, :article_id

  validates :notes, presence:true, uniqueness:true
  
  belongs_to :article
end
