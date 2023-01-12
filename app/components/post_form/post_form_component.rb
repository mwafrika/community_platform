# frozen_string_literal: true

module PostForm
  class PostFormComponent < ViewComponent::Base
    def initialize(post:, groups:)
      @post = post
      @groups = groups
    end
  end
end
