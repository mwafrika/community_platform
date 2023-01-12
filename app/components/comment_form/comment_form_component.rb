# frozen_string_literal: true

module CommentForm
  class CommentFormComponent < ViewComponent::Base
    def initialize(comment:, post:, parent:)
      @comment = comment
      @post = post
      @parent = parent
    end
  end
end
