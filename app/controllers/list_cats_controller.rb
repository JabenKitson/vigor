class ListCatsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /list_cats
  # GET /list_cats.xml
  def index
    @list_cats = ListCat.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @list_cats }
    end
  end

  # GET /list_cats/1
  # GET /list_cats/1.xml
  def show
    @list_cat = ListCat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @list_cat }
    end
  end

  # GET /list_cats/new
  # GET /list_cats/new.xml
  def new
    @list_cat = ListCat.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @list_cat }
    end
  end

  # GET /list_cats/1/edit
  def edit
    @list_cat = ListCat.find(params[:id])
  end

  # POST /list_cats
  # POST /list_cats.xml
  def create
    @list_cat = ListCat.new(params[:list_cat])

    respond_to do |format|
      if @list_cat.save
        flash[:notice] = 'ListCat was successfully created.'
        format.html { redirect_to(:controller => 'list_cats', :action => 'edit', :id => @list_cat.id) }
        format.xml  { render :xml => @list_cat, :status => :created, :location => @list_cat }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @list_cat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /list_cats/1
  # PUT /list_cats/1.xml
  def update
    @list_cat = ListCat.find(params[:id])
    allcontacts = Friend.find(:all)   
     for acontact in allcontacts do
       list = List.find(:all,:conditions => "friend_id = #{acontact.id} and list_cat_id = #{@list_cat.id}")
       if params["#{acontact.id}"] == "on" and !list[0]
         list = List.new(:friend_id => acontact.id,:list_cat_id => @list_cat.id)
         list.save
       end
       if params["#{acontact.id}"] != "on" and list[0]
         list[0].destroy
       end
     end
    respond_to do |format|
      if @list_cat.update_attributes(params[:list_cat])
        flash[:notice] = 'ListCat was successfully updated.'
        format.html { redirect_to(:controller => 'list_cats', :action => 'edit', :id => @list_cat.id) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @list_cat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /list_cats/1
  # DELETE /list_cats/1.xml
  def destroy
    listentries = List.find(:all,:conditions => "list_cat_id = #{params[:id]}")
    for listentry in listentries 
      listentry.destroy
      end
    @list_cat = ListCat.find(params[:id])
    @list_cat.destroy

    respond_to do |format|
      format.html { redirect_to(:controller => 'lists') }
      format.xml  { head :ok }
    end
  end
end
