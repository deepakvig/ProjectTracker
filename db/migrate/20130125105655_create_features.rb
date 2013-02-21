class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :title
      t.text :description
      t.references :user
      t.references :project

      t.timestamps
    end
    add_index :features, :user_id
    add_index :features, :project_id
  end
end
