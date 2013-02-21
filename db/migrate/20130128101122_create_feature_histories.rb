class CreateFeatureHistories < ActiveRecord::Migration
  def change
    create_table :feature_histories do |t|
      t.string :title
      t.text :description
      t.integer :priority
      t.string :status
      t.string :accepted
      t.references :user
      t.references :project

      t.timestamps
    end
    add_index :feature_histories, :user_id
    add_index :feature_histories, :project_id
  end
end
