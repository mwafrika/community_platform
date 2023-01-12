# frozen_string_literal: true

class AddReference < ActiveRecord::Migration[7.0]
  def change
    remove_column :groups, :user_id
    add_reference :groups, :user, foreign_key: true
  end
end
