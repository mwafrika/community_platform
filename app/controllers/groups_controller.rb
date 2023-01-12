# frozen_string_literal: true

class GroupsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_group, only: %i[show edit update destroy]

  def index
    @groups = Group.all
  end

  def show
    @posts = @group.posts
    @members = @group.users
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      current_user.groups << @group
      redirect_to @group, notice: 'Group was successfully created.'
    else
      render :new
    end
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def join
    @group = Group.find(params[:id])
    Membership.create(group: @group, user: current_user)
    redirect_to @group, notice: 'You have joined the group.'
  end

  def leave
    @group = Group.find(params[:id])
    Membership.where(group: @group, user: current_user).destroy_all
    redirect_to @group, notice: 'You have left the group.'
  end
end
