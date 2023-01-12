# frozen_string_literal: true

module Tabs
  class TabComponent < ViewComponent::Base
    def initialize(groups:, show_join_button:, show_delete_button:, show_leave_button:)
      @groups = groups
      @show_join_button = show_join_button
      @show_delete_button = show_delete_button
      @show_leave_button = show_leave_button
    end

    private

    attr_accessor :groups, :show_join_button, :show_delete_button, :show_leave_button
  end
end
