require 'fastercsv'

class FriendsController < ApplicationController
before_filter :authenticate_user!
load_and_authorize_resource
  # GET /friends
  # GET /friends.xml
  def index
    @friends = Friend.find(:all)
    @list_categories = ListCat.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @friends }
    end
  end
  
  def list
    @list_categories = ListCat.find(:all)
    filter = "("
    @nolistschecked = 1
    for alist in @list_categories do #choose contacts who are in the selected lists
     if params["#{alist["id"]}"] == "on" then 
      @nolistschecked = 0
      filter += "B.list_cat_id = #{alist["id"]} or "
     end
    end    
    filter += "#{@nolistschecked})"
    if params["fil_email"] != "" then filter += " and A.email = '#{params["fil_email"]}'" end
    if params["fil_city" ] != "" then filter += " and A.city = '#{params["fil_city"]}'" end
    if params["fil_state" ] != "" then filter += " and A.state = '#{params["fil_state"]}'" end
    if params["fil_fname" ] != "" then filter += " and A.fname = '#{params["fil_fname"]}'" end
    if params["fil_lname" ] != "" then filter += " and A.lname = '#{params["fil_lname"]}'" end
 
    if @nolistschecked == 0 then @friends = Friend.find_by_sql("select distinct A.id, A.fname, A.lname, A.email, A.hphone,A.wphone,A.cphone,A.fax,A.street,A.city,A.state,A.country,A.zip,A.user_id from friends A join lists B where A.id = B.friend_id and #{filter} order by A.lname" )
    end
    if @nolistschecked == 1 then  @friends = Friend.find_by_sql("select distinct A.id, A.fname, A.lname, A.email, A.hphone,A.wphone,A.cphone,A.fax,A.street,A.city,A.state,A.country,A.zip,A.user_id from friends A where #{filter} order by A.lname" )  
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @friends }
    end
  end

  # GET /friends/1
  # GET /friends/1.xml
  def show
    @friend = Friend.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @friend }
    end
  end

  # GET /friends/new
  # GET /friends/new.xml
  def new
    @friend = Friend.new


    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @friend }
    end
  end

  # GET /friends/1/edit
  def edit
    @friend = Friend.find(params[:id])
  end

  # POST /friends
  # POST /friends.xml
  def create
    @friend = Friend.new(params[:friend])
    
   logins = User.find(:all) 
   @friend.user_id = -1
   for login in logins 
    if params["user_id"] == login.login then @friend.user_id = login.id end
   end
  
    respond_to do |format|
      if @friend.save
        flash[:notice] = 'Friend was successfully created.'
        format.html { redirect_to(:controller => 'friends', :action => 'edit', :id => @friend.id) }
        format.xml  { render :xml => @friend, :status => :created, :location => @friend }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @friend.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /friends/1
  # PUT /friends/1.xml
  def update
    @friend = Friend.find(params[:id])
   
   logins = User.find(:all) 
   else @friend.user_id = -1 
   for login in logins 
    if params["user_id"] == login.login then @friend.user_id = login.id 
   end
             
    end
    alllistcats = ListCat.find(:all)   
     for alistcat in alllistcats do
       list = List.find(:all,:conditions => "friend_id = #{@friend.id} and list_cat_id = #{alistcat.id}")
       if params["#{alistcat.id}"] == "on" and !list[0]
         list = List.new(:friend_id => @friend.id,:list_cat_id => alistcat.id)
         list.save
       end
       if params["#{alistcat.id}"] != "on" and list[0]
         list[0].destroy
       end
     end
     
    respond_to do |format|
      if @friend.update_attributes(params[:friend])
        flash[:notice] = 'Friend was successfully updated.'
        format.html { redirect_to(:controller => 'friends', :action => 'edit', :id => @friend.id) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @friend.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1
  # DELETE /friends/1.xml
  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy

    respond_to do |format|
      format.html { redirect_to(friends_url) }
      format.xml  { head :ok }
    end
  end
  
  #
def dump_csv
#
#
@outfile = "vigor_contacts_" + Time.now.strftime("%m-%d-%Y") + ".csv"
#
 
#
csv_data = FasterCSV.generate do |csv|
#

 csv <<  params["friends_csv_headers"]
  #
 params["friends_csv_numrec"].to_i.times do |x|
 csv << params["friends_csv_array#{x}"] 
 end

#

end
#
 
#
send_data csv_data,
#
:type => 'text/csv; charset=iso-8859-1; header=present',
#
:disposition => "attachment; filename=#{@outfile}"
#
 
end

end