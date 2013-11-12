class VegresourcesController < ApplicationController
    before_filter :authenticate_user!, :only => [ :edit, :new, :update, :review, :highlight ]
    load_and_authorize_resource
    layout '/layouts/vegresources'
  # GET /vegresources
  # GET /vegresources.json
  def index
  end
  
  def restaurants
    @restaurants = Vegresource.where("vrtype = 'restaurant'")
    @vrtype = 'restaurant'

    respond_to do |format|
      format.html # index.html.erb
    #  format.json { render :json => @restaurants }
    end
  end
  
    def csas
    @csas = Vegresource.where("vrtype = 'csa'")
    @vrtype = 'csa'

    respond_to do |format|
      format.html # index.html.erb
   #   format.json { render :json => @csas }
    end
  end

  def grocery
    @grocers = Vegresource.where("vrtype = 'grocer'")
    @vrtype = 'grocer'

    respond_to do |format|
      format.html # index.html.erb
    #  format.json { render :json => @grocers}
    end
  end
  
    def books
    @books = Vegresource.where("vrtype = 'book'")
    @vrtype = 'book'

    respond_to do |format|
      format.html # index.html.erb
    #  format.json { render :json => @grocers}
    end
  end
  
    def videos
    @videos = Vegresource.where("vrtype = 'video'")
    @vrtype = 'video'
    

    respond_to do |format|
      format.html # index.html.erb
    #  format.json { render :json => @grocers}
    end
  end
  
    def websites
    @websites = Vegresource.where("vrtype = 'website'")
    @vrtype = 'website'

    respond_to do |format|
      format.html # index.html.erb
     # format.json { render :json => @grocers}
    end
  end



  # GET /vegresources/1
  # GET /vegresources/1.json
  def show
    @vegresource = Vegresource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
     # format.json { render :json => @vegresource }
    end
  end

  # GET /vegresources/new
  # GET /vegresources/new.json
  def new
    @vegresource = Vegresource.new
    @vrtype = params[:vrtype]
    respond_to do |format|
      format.html # new.html.erb
     # format.json { render :json => @vegresource }
    end
  end

  # GET /vegresources/1/edit
  def edit
    @vegresource = Vegresource.find(params[:id])
    @vrtype = @vegresource.vrtype
  end
  
   # GET /vegresources/1/review
  def review
    @vegresource = Vegresource.find(params[:id])
  end
   
    def highlight
    @vegresource = Vegresource.find(params[:id])
    @vrhighlight = @vegresource.vrhighlights.create
  end
  
   def vrattributes
  vrattribute = Vrattribute.find_by_name(name)
     # Vrattribute_assignment.create(:vrattribute_id => vrattribute, :vegresource_id => @vegresource) unless Vrattribute_assignment.where("vrattribute_id = ? AND vegresource_id = ?",vrattribute.id,@vegresource)
   # end
  
      respond_to do |format|
        format.html{ render_text output}
        format.html { redirect_to @vegresource, :notice => 'Attributes successfully added.' }
      #  format.json { render :json => @vegresource, :status => :created, :location => @vegresource }
    
    end
  end

  # POST /vegresources
  # POST /vegresources.json
  def create
    @vegresource = Vegresource.new(params[:vegresource])
    @vegresource.user_id = current_user.id
    respond_to do |format|
      if @vegresource.save
        format.html { redirect_to @vegresource, :notice => 'Vegresource was successfully created.' }
      #  format.json { render :json => @vegresource, :status => :created, :location => @vegresource }
      else
        format.html { render :action => "new" }
       # format.json { render :json => @vegresource.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /vegresources/1
  # PUT /vegresources/1.json
  def update
    @vegresource = Vegresource.find(params[:id])
    
    ################################################################################
    # Create attribute assignements for all that were checked for this resource 
    # and delete any that were previously assigned, but currently unchecked
    ################################################################################
    # 1.a If attribute boxes were checked
    #if params[:vrattributes]
    #  checkedattributes = params[:vrattributes]
      
      # 2. Walk through all attributes for this resource type
    #  Vrattribute.where(:vrtype => @vegresource.vrtype).each do |vrattribute| 
     #   currentlyassigned = Vraa.where("vrattribute_id = ? AND vegresource_id = ?",vrattribute.id,@vegresource.id.to_s)
 
        # 3.a Remove the attribute from this resource if it's currently assigned and unchecked
     #   if (currentlyassigned && checkedattributes.include?(vrattribute.name).blank? ) 
    #      @vegresource.vraas.delete(currentlyassigned)

        # 3.b Otherwise assign this attribute if it's checked
    #    elsif checkedattributes.include?(vrattribute.name)       
    #     Vraa.create(:vrattribute_id => vrattribute.id, :vegresource_id => @vegresource.id)
    #    end
    #  end
      
    # 1.b If nothing was checked make sure any remaining are unassigned
  #  elsif Vraa.where(:vegresource_id => @vegresource.id)
   #   Vraa.where(:vegresource_id => @vegresource.id).each do |remaining|
   #     @vegresource.vraas.delete(remaining)
   #   end
  #  end
    ##################################################################################
    respond_to do |format|
      if @vegresource.update_attributes(params[:vegresource])
        format.html { redirect_to @vegresource, :notice => 'Vegresource was successfully updated.' }
      #  format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        #format.json { render :json => @vegresource.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /vegresources/1
  # DELETE /vegresources/1.json
  def destroy
    @vegresource = Vegresource.find(params[:id])
    @vegresource.destroy

    respond_to do |format|
      format.html { redirect_to vegresources_url }
     # format.json { head :no_content }
    end
  end
end
