# frozen_string_literal: true

module Posts
  class PostCardComponent < ViewComponent::Base
    def initialize(post:)
      @post = post
    end
  end
end
