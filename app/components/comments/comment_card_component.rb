# frozen_string_literal: true

module Comments
  class CommentCardComponent < ViewComponent::Base
    def initialize(comment:, post:)
      @comment = comment
      @post = post
    end
  end
end
