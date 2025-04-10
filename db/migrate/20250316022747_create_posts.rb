class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.text :prefectures
      t.text :domicile
      t.timestamps
    end
  end
end
