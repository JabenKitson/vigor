class AttachmentsController < ApplicationController
  # GET /attachments
  # GET /attachments.json
  before_filter :authenticate_user!, :only => [ :edit, :new, :update ]
  load_and_authorize_resource
  
  def index
    @attachments = Attachment.all

    respond_to do |format|
      format.html # index.html.erb
     # format.json { render :json => @attachments }
    end
  end

  # GET /attachments/1
  # GET /attachments/1.json
  def show
    @attachment = Attachment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
     # format.json { render :json => @attachment }
    end
  end

  # GET /attachments/new
  # GET /attachments/new.json
  def new
    @attachment = Attachment.new

    respond_to do |format|
      format.html # new.html.erb
     # format.json { render :json => @attachment }
    end
  end

  # GET /attachments/1/edit
  def edit
    @attachment = Attachment.find(params[:id])
  end

  # POST /attachments
  # POST /attachments.json
  def create
    @attachment = Attachment.new(params[:attachment])

    respond_to do |format|
      if @attachment.save
        format.html { redirect_to @attachment, :notice => 'Attachment was successfully created.' }
       # format.json { render :json => @attachment, status: :created, location: @attachment }
      else
        format.html { redirect_to request.referrer}
       # format.json { render :json => @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attachments/1
  # PUT /attachments/1.json
  def update
    @attachment = Attachment.find(params[:id])

    respond_to do |format|
      if @attachment.update_attributes(params[:attachment])
        format.html { redirect_to request.referer, :notice => 'Attachment was successfully updated.' }
       # format.json { head :no_content }
      else
        format.html { redirect_to request.referrer }
       # format.json { render :json => @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attachments/1
  # DELETE /attachments/1.json
  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy

    respond_to do |format|
     # format.html { redirect_to session.delete(:return_to)  }
      format.html { redirect_to request.referer  }
     # format.json { head :no_content }
    end
  end
end