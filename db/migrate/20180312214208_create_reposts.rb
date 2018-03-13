class CreateReposts < ActiveRecord::Migration[5.1]
  def change
    create_table :reposts do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
    end
    add_index :reposts, [:user_id, :created_at]
    add_index :reposts, [:post_id, :created_at]

  end
end
