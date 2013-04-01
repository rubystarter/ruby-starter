class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.text :notes
      t.string :author

      t.timestamps
    end
  end
end
