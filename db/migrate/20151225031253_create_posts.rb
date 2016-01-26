 class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :description
      t.float :strong_point

      t.timestamps null: false
    end
  end
end
