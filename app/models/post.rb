# frozen_string_literal: true

# require 'pry-rails'

class Post < ApplicationRecord
  # binding.pry

  belongs_to :user
  belongs_to :group
  has_many :comments, dependent: :destroy

  # scope :by_member, ->(user) { where(author: user) }

  # scope :active, -> {where(:active => true)}
end
