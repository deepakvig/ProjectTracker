class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :email
      t.references :project

      t.timestamps
    end
    add_index :invitations, :project_id
  end
end
