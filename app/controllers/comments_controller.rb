class CommentsController < ApplicationController
  before_filter :login_required
  
  before_filter :load_parent
  
  def index
    @comments = @post.comments
  end
  
  def show
    @comment = @post.comments.find(params[:id])
  end
  
  def new
    @comment = @post.comments.build
    respond_to do |wants|
      wants.html

      wants.js { render :action => "dialog" }

    end
    
  end
  
  def create
    
    @comment = @post.comments.build(params[:comment])
    respond_to do |wants|
      if @comment.save
        wants.html do
          flash[:notice] = "Successfully created comment."
          redirect_to @comment
        end

        wants.js

      else
        wants.html { render :action => 'new' }

        wants.js { render :action => 'error' }
        
      end
    end
  end
  
  def edit
    
    @comment = @post.comments.find(params[:id])
    respond_to do |wants|
      wants.html

      wants.js { render :action => "dialog" }

    end

  end
  
  def update
    
    @comment = @post.comments.find(params[:id])
    respond_to do |wants|
      if @comment.update_attributes(params[:comment])
        wants.html do
          flash[:notice] = "Successfully updated comment."
          redirect_to @comment
        end

        wants.js

      else
        wants.html { render :action => 'edit' }

        wants.js { render :action => 'error' }

      end
    end
  end
  
  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "Successfully removed comment."
    redirect_to root_path
  end
  
  protected
  
  def load_parent
    @post = Post.find(params[:post_id])  
  end
  
end
