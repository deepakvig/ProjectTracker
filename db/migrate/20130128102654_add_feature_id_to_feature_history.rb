class AddFeatureIdToFeatureHistory < ActiveRecord::Migration
  def change
    add_column :feature_histories, :feature_id, :integer
  end
end
