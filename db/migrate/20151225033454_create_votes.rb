class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.string :post_id
      t.string :integer

      t.timestamps null: false
    end
  end
end
