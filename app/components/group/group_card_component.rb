# frozen_string_literal: true

module Group
  class GroupCardComponent < ViewComponent::Base
    def initialize(group:, current_user:)
      @group = group
      @current_user = current_user
    end
  end
end
