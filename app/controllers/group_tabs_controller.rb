# frozen_string_literal: true

class GroupTabsController < ApplicationController
  def index
    @groups = Group.all
    @show_join_button = true
    @show_leave_button = false
    @show_delete_button = false
  end
  
  def created
    # ing.pry
    @groups = current_user.groups
    @show_delete_button = true
    @show_join_button = false
    @show_leave_button = false
  end

  def belonging
    @groups = current_user.memberships
    @show_delete_button = false
    @show_join_button = false
    @show_leave_button = true
  end
end
