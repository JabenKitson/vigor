class EventsController < ApplicationController
  # GET /events
  # GET /events.xml
  protect_from_forgery :only => [:create, :update, :destroy] 
  before_filter :authenticate_user!, :only => [ :edit, :new, :update ]
  load_and_authorize_resource
  layout '/layouts/events' 
  
  def index
    @events = Event.find(:all)   
   if params[:calendarmonth] && params[:calendaryear]
     @calendardate = Time.local( params[:calendaryear] , params[:calendarmonth] )        
   else
      @calendardate = Time.now()
   end  
   if params[:month] == "prev" 
     @calendardate = @calendardate - 1.month
   elsif params[:month] == "next"
     @calendardate = @calendardate + 1.month
    
   end 
   @upcoming = Event.upcoming(10,@calendardate) 
   
   end
   
    # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])
    @event.user_id = current_user.id
    respond_to do |format|
      if @event.save
        flash[:notice] = 'Events was successfully created.'
        format.html { redirect_to(@event) }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  
   
  def review
    @event = Event.find(params[:id])
  end
   
   
   def list
   @events = Event.find(:all)   
   if params[:calendarmonth] && params[:calendaryear]
     @calendardate = Time.local( params[:calendaryear] , params[:calendarmonth] )        
   else
      @calendardate = Time.now()
   end  
   if params[:month] == "prev" 
     @calendardate = @calendardate - 1.month
   elsif params[:month] == "next"
     @calendardate = @calendardate + 1.month
    
   end 
   @upcoming = Event.upcoming(10,@calendardate) 
   
  end

  def calendar
   
   if params[:calendarmonth] && params[:calendaryear]
     @calendardate = Time.local( params[:calendaryear] , params[:calendarmonth] )  
     puts @calendardate       
   else @calendardate = Time.now()
   end
  
   if params[:month] == "prev" 
     @calendardate = @calendardate - 1.month
   elsif params[:month] == "next"
     @calendardate = @calendardate + 1.month
   end  
  end
 
  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new 
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @events }
    end
  end

  def copy
    @copy = Event.find(params[:id])
    @event = Event.new 
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @events }  
    end
  end
  
  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end


  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        flash[:notice] = 'Event was successfully updated.'
        format.html { redirect_to(@event) }
        format.xml  { head :ok }
      else
        format.html { redirect_to :back rescue ActionController::RedirectBackError redirect_to events_path }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    if can? :manage, :all
    @event = Event.find(params[:id])
    @event.destroy
    end
    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
    end
  end
  
end
