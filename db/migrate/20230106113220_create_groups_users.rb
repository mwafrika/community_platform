# frozen_string_literal: true

class CreateGroupsUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :groups_users do |t|
      t.references :user, foreign_key: { to_table: :users }
      t.references :group, foreign_key: { to_table: :groups }
      t.timestamps
    end
    remove_column :groups, :user_id
  end
end
