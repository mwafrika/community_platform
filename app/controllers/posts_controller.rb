# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_post, only: %i[show edit update destroy]

  def show
    @comments = @post.comments.order(created_at: :desc)
  end

  def new
    @post = Post.new
    @groups = current_user.groups
  end

  def create
    @post = Post.new(post_params)
    @group = Group.find(params[:group_id])

    @post.user = current_user

    if @post.save
      redirect_to group_path(@group), notice: 'Post created successfully.'
    else
      render :new
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :group_id)
  end
end
