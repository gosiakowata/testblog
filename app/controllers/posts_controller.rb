class PostsController < ApplicationController
  before_filter :authenticate_user!
  skip_before_filter :display_flash_notice, only: :index
  expose_decorated(:posts) { Post.where(archived: false) }
  expose_decorated(:post)

  def index
  end

  def new
  end

  def edit
  end

  def update
    if post.save
      render action: :index
    else
      render :new
    end
  end

  def destroy
    if post.user == current_user
      post.destroy
      render action: :index
    else
      render action: :index
    end
  end

  def show
  end

  def mark_archived
    post.archived = true
    post.save
    redirect_to action: :index
  end

  def create
    if post.save
      redirect_to action: :index
    else
      render :new
    end
  end

end
