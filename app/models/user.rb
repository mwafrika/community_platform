# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:

  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_and_belongs_to_many :groups, join_table: :groups_users

  # has_many :posts, dependent: :destroy, inverse_of: :user

  # has_many :comments, dependent: :destroy, inverse_of: :user

  has_many :comments, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :groups, through: :memberships, dependent: :destroy
  has_many :posts, dependent: :destroy
end
