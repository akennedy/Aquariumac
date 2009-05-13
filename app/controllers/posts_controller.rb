class PostsController < ApplicationController
  before_filter :login_required
  
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
    respond_to do |wants|
      wants.html

      wants.js { render :action => "dialog" }

    end
    
  end
  
  def create
    @post = Post.new(params[:post])
    respond_to do |wants|
      if @post.save
        wants.html do
          flash[:notice] = "Successfully created post."
          redirect_to @post
        end

        wants.js

      else
        wants.html { render :action => 'new' }

        wants.js { render :action => 'error' }
        
      end
    end
  end
  
  def edit
    @post = Post.find(params[:id])
    respond_to do |wants|
      wants.html

      wants.js { render :action => "dialog" }

    end

  end
  
  def update
    @post = Post.find(params[:id])
    respond_to do |wants|
      if @post.update_attributes(params[:post])
        wants.html do
          flash[:notice] = "Successfully updated post."
          redirect_to @post
        end

        wants.js

      else
        wants.html { render :action => 'edit' }

        wants.js { render :action => 'error' }

      end
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Successfully removed post."
    redirect_to posts_url
  end
end
