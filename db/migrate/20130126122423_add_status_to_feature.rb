class AddStatusToFeature < ActiveRecord::Migration
  def change
    add_column :features, :status, :string
  end
end
