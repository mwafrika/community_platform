# frozen_string_literal: true

module GroupForm
  class GroupFormComponent < ViewComponent::Base
    def initialize(group:)
      @group = group
    end
  end
end
