class AddArticleIdToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :article_id, :integer
  end
end
