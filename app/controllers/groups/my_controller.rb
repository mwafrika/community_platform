# frozen_string_literal: true

module Groups
  class MyController < ApplicationController
    def index
      @my_groups = current_user.groups
      render json: @my_groups
    end
  end
end
