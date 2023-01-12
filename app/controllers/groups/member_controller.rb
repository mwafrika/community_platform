# frozen_string_literal: true

module Groups
  class MemberController < ApplicationController
    def index
      @member_groups = Group.joins(:users).where(users: { id: current_user.id })
      render json: @member_groups
    end
  end
end
