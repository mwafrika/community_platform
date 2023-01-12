# frozen_string_literal: true

class UpdateInputFields < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :user_id, :string
    rename_column :posts, :author_id, :user_id
    rename_column :comments, :author_id, :user_id
    drop_table :group_members
  end
end
