class AquariaController < ApplicationController
  before_filter :load_parent
  
  def index
    @aquaria = @user.aquaria.all
  end
  
  def show
    @aquarium = @user.aquaria.find(params[:id])
  end
  
  def new
    @aquarium = @user.aquaria.build
    respond_to do |wants|
      wants.html

      wants.js { render :action => "dialog" }

    end
    
  end
  
  def create
    
    @aquarium = @user.aquaria.build(params[:aquarium])
    respond_to do |wants|
      if @aquarium.save
        wants.html do
          flash[:notice] = "Successfully created aquarium."
          redirect_to @aquarium
        end

        wants.js

      else
        wants.html { render :action => 'new' }

        wants.js { render :action => 'error' }
        
      end
    end
  end
  
  def edit
    
    @aquarium = @user.aquaria.find(params[:id])
    respond_to do |wants|
      wants.html

      wants.js { render :action => "dialog" }

    end

  end
  
  def update
    
    @aquarium = @user.aquaria.find(params[:id])
    respond_to do |wants|
      if @aquarium.update_attributes(params[:aquarium])
        wants.html do
          flash[:notice] = "Successfully updated aquarium."
          redirect_to user_aquaria_path(@user)
        end

        wants.js

      else
        wants.html { render :action => 'edit' }

        wants.js { render :action => 'error' }

      end
    end
  end
  
  def destroy
    @aquarium = @user.aquaria.find(params[:id])
    @aquarium.destroy
    flash[:notice] = "Successfully removed aquarium."
    redirect_to user_aquaria_path(@user)
  end
  
  protected
  
  def load_parent
    @user = User.find(session[:user_id]) 
  end
  
end
