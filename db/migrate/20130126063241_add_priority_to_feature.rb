class AddPriorityToFeature < ActiveRecord::Migration
  def change
    add_column :features, :priority, :integer
  end
end
