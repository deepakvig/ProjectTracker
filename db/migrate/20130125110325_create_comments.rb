class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :description
      t.references :user
      t.references :feature

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :feature_id
  end
end
