class AddAcceptedToFeature < ActiveRecord::Migration
  def change
    add_column :features, :accepted, :string
  end
end
