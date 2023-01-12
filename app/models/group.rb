# frozen_string_literal: true

# require 'pry-rails'
class Group < ApplicationRecord
  # binding.pry
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships, dependent: :destroy
  has_many :posts, dependent: :destroy
end
