# frozen_string_literal: true

module Theme
  class ThemePickerComponent < ViewComponent::Base
    def initialize
      # @items = items

      # @selected_item = selected_item
    end

    def select_tag_options
      options = {}

      options[:data] = {

        controller: 'theme--theme-picker-component',

        action: 'change->theme--theme-picker-component#change'

      }

      options
    end
  end
end
