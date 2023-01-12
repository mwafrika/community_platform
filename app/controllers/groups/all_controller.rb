# frozen_string_literal: true

module Groups
  class AllController < ApplicationController
    def index
      @groups = Group.all
      render json: @groups
    end
  end
end
