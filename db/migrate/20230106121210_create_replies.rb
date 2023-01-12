# frozen_string_literal: true

class CreateReplies < ActiveRecord::Migration[7.0]
  def change
    create_table :replies do |t|
      t.text :body
      t.references :user, foreign_key: { to_table: :users }
      t.references :comment, foreign_key: { to_table: :comments }
      t.timestamps
    end
  end
end
