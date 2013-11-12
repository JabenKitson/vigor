class VrhighlightsController < ApplicationController
    before_filter :authenticate_user!, :only => [ :edit, :new, :update ]
    load_and_authorize_resource
  # GET /vrhighlights
  # GET /vrhighlights.json
  def index
    @vrhighlights = Vrhighlight.all

    respond_to do |format|
      format.html # index.html.erb
     # format.json { render json: @vrhighlights }
    end
  end

  # GET /vrhighlights/1
  # GET /vrhighlights/1.json
  def show
    @vrhighlight = Vrhighlight.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
     # format.json { render json: @vrhighlight }
    end
  end

  # GET /vrhighlights/new
  # GET /vrhighlights/new.json
  def new
    @vrhighlight = Vrhighlight.new

    respond_to do |format|
      format.html # new.html.erb
     # format.json { render json: @vrhighlight }
    end
  end

  # GET /vrhighlights/1/edit
  def edit
    @vrhighlight = Vrhighlight.find(params[:id])
    @vegresource = @vrhighlight.vegresource
  end

  # POST /vrhighlights
  # POST /vrhighlights.json
  def create
    @vrhighlight = Vrhighlight.new(params[:vrhighlight])
    @vrhighlight.user_id = current_user.id

    respond_to do |format|
      if @vrhighlight.save
        format.html { redirect_to :back, :notice => 'vrhighlight was successfully created.' }
       # format.json { render json: @vrhighlight, status: :created, location: @vrhighlight }
      else
        format.html { render :action => "new" }
       # format.json { render json: @vrhighlight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vrhighlights/1
  # PUT /vrhighlights/1.json
  def update
    @vrhighlight = Vrhighlight.find(params[:id])

    respond_to do |format|
      if @vrhighlight.update_attributes(params[:vrhighlight])
        format.html { redirect_to :back, :notice => 'vrhighlight was successfully updated.' }
       # format.json { head :no_content }
      else
        format.html { render :action => "edit" }
       # format.json { render json: @vrhighlight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vrhighlights/1
  # DELETE /vrhighlights/1.json
  def destroy
    @vrhighlight = Vrhighlight.find(params[:id])
    @vrhighlight.destroy

    respond_to do |format|
      format.html { redirect_to :back }
     # format.json { head :no_content }
    end
  end
end
