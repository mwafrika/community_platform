# frozen_string_literal: true

class CreateMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :memberships do |t|
      t.references :user, foreign_key: { to_table: :users }
      t.references :group, foreign_key: { to_table: :groups }
      t.timestamps
    end
    drop_table :groups_users
  end
end
