# frozen_string_literal: true

class Reply < ApplicationRecord
  belongs_to :user, inverse_of: :replies
  belongs_to :comment, inverse_of: :replies
end
