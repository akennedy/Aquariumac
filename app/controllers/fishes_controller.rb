class FishesController < ApplicationController
  
  before_filter :login_required
  
  def index
 
    if params[:q] and params[:q].blank? == false
 
      @fishes = Fish.find(:all) do
        any do
            all do
              genus_name =~ params[:q].split(' ')[0] + '%'
              species_name =~ params[:q].split(' ')[1] + '%' if params[:q].split(' ').length > 1
            end
            all do
              species_name =~ params[:q].split(' ')[0] + '%'
              genus_name =~ params[:q].split(' ')[1] + '%' if params[:q].split(' ').length > 1
            end
            all do
              common_name.contains? params[:q] 
            end
        end
      end
 
 
      # Quick fix to resolve issue, need to come back to this
      # and look at it in more depth for optimal way to handle this request
      if params[:view] == 'Freshwater'
        #filter out Saltwater Fish
        @fishes.each do |i|
          if i.water_type == "Saltwater"
            @fishes.delete(i)
          end
        end
      else
        #filter out Freshwater Fish
        @fishes.each do |i|
          if i.water_type == "Freshwater"
            @fishes.delete(i)
          end
        end
      end
    elsif params[:view] == 'Freshwater'
      @fishes = Fish.all(:conditions => ["water_type = ?", 'Freshwater'])
    else
      @fishes = Fish.all(:conditions => ["water_type != ?", 'Freshwater'])
    end
    
    @fishes = @fishes.paginate :page => params[:page], :per_page => 3
    
    respond_to do |wants|
      wants.html
      wants.js { render :layout => "javascripts"}
    end
    
  end
  
  def show
    @fish = Fish.find(params[:id])
  end
  
  def new
    @fish = Fish.new
    respond_to do |wants|
      wants.html

      wants.js { render :action => "dialog" }

    end
    
  end
  
  def create
    @fish = Fish.new(params[:fish])
    respond_to do |wants|
      if @fish.save
        wants.html do
          flash[:notice] = "Successfully created fish."
          redirect_to @fish
        end

        wants.js

      else
        wants.html { render :action => 'new' }

        wants.js { render :action => 'error' }
        
      end
    end
  end
  
  def edit
    @fish = Fish.find(params[:id])
    respond_to do |wants|
      wants.html

      wants.js { render :action => "dialog" }

    end

  end
  
  def update
    @fish = Fish.find(params[:id])
    respond_to do |wants|
      if @fish.update_attributes(params[:fish])
        wants.html do
          flash[:notice] = "Successfully updated fish."
          redirect_to @fish
        end

        wants.js

      else
        wants.html { render :action => 'edit' }

        wants.js { render :action => 'error' }

      end
    end
  end
  
  def destroy
    @fish = Fish.find(params[:id])
    @fish.destroy
    flash[:notice] = "Successfully removed fish."
    redirect_to fishes_url
  end
end
