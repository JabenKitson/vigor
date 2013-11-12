class HomeController < ApplicationController
  protect_from_forgery :only => [:create, :update, :destroy] 
  layout :resolve_layout
  def index
    @calendardate = Time.now
    header_imgs = Attachment.where(:eligibility => 1)
    header_img = header_imgs[rand(header_imgs.length)]
    @header_img_url = header_img.photo.url(:large) unless header_img.blank?
    @header_img_url = header_img.photo.url unless header_img.blank? || header_img.photo.size(:large)
    @header_thumb_url = header_img.photo.url(:thumb) unless header_img.blank?
    @header_thumb_url ||= header_img.photo.url(:small) unless header_img.blank?
    @header_thumb_url ||= header_img.photo.url(:medium) unless header_img.blank?
    @header_thumb_url ||= header_img.photo.url(:large) unless header_img.blank?
    @header_thumb_url ||= header_img.photo.url  unless header_img.blank?
    @parent = header_img.vegresource if header_img && header_img.vegresource
    @parent = header_img.recipe if header_img && header_img.recipe
    @parent = header_img.post if header_img &&  header_img.post
    @parent = header_img.event if header_img &&  header_img.event
    @parent = header_img.review.event if header_img &&  header_img.review && header_img.review.event
    @parent = header_img.review.recipe if header_img &&  header_img.review && header_img.review.recipe
    @parent = header_img.review.vegresource if header_img &&  header_img.review && header_img.review.vegresource
    @parent = header_img.vrhighlight.vegresource if header_img &&  header_img.vrhighlight && header_img.review.vegresource
    @picture_title = nil
    @picture_title = @parent.title if ['Vegresource','Post','Review'].include?(@parent.class.to_s) 
    @picture_title = @parent.etitle if @parent.class.to_s == 'Event'
    @picture_title = @parent.name if ['User','Recipe','Vrhighlight'].include?(@parent.class.to_s)
    render :layout => 'home'
  end
   
  def about 
  end
  
  def contribute
  end

  def contact
  end

  def dine
  end

  def pay
  @fname=params[:fname]
  @lname=params[:lname]
  @email=params[:email]
  @mail=params[:mail]
  @item=params[:item]
  @amount=params[:amount]
  @comments=params[:comments][:text]
   begin
   #First check if the senders email is valid

   if validate_recap(params,ActiveResource::Errors.new([])) && @email =~ /^[a-zA-Z0-9._%-]+@(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]{2,4}$/ then
   #put all the contents of my form in a hash
   
   mail_info = {"from_name" => "#{@fname} #{@lname}", "from_email" =>
   @email, "message" => @comments, "subject" => @item, "mail" => @mail, "amount" => @amount}
   #Call the Notifier class and send the email
   Notifier.deliver_multipart_pay(mail_info)

   flash[:notice] = 'Your message was successfully delivered.'
    
   else
  #if the senders email address is not valid
  #display a warning and redirect to any action you want
  flash[:warning] = 'Either your email address or recaptcha phrase appears to be invalid.'
   redirect_to(:controller => "home", :action => "contribute")
  end
    
  rescue
  #if everything fails, display a warning and the exception
  #Maybe not always advisable if your app is public
  #But good for debugging, especially if action mailer is setup wrong
  flash[:warning] = "Your message could not be delivered at this time. #$!. Please try again later"
   redirect_to(:controller => "home", :action => "contribute")
   end

  end

   def my_mailer
    
   from_name = params[:comment][:name]
   from_email = params[:comment][:email]
   the_subject = params[:comment][:subject]
   @message = params[:comment][:message]
   
   begin
   #First check if the senders email is valid
   if (user_signed_in || verify_recaptcha) && from_email =~ /^[a-zA-Z0-9._%-]+@(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]{2,4}$/ then
   #put all the contents of my form in a hash
   mail_info = {"from_name" => from_name, "from_email" => from_email, "message" => @message, "subject" => the_subject}
   #Call the Notifier class and send the email
   Notifier.deliver_multipart_contact(mail_info)
   #Display a message notifying the sender that his email was delivered.
   flash[:notice] = 'Your message was successfully delivered.'
   #flash[:notice] = 'Your message was not delivered. Please try again next week.'
   #Then redirect to index or any page you want with the message
   redirect_to(:controller => "home", :action => "contact")
    
   else
  #if the senders email address is not valid
  #display a warning and redirect to any action you want
  flash[:warning] = 'Either your email address or recaptcha phrase appears to be invalid.'
  redirect_to(:controller => "home", :action => "contact")
  end
    
  rescue
  #if everything fails, display a warning and the exception
  #Maybe not always advisable if your app is public
  #But good for debugging, especially if action mailer is setup wrong
  flash[:warning] = "Your message could not be delivered at this time. #$!. Please try again later"
   redirect_to(:controller => "home", :action => "contact")
   end
   
  end

  def send_email2list
  
  @list_cat_id=params[:list][:list_cat_id]
  @message=params[:message]
  @doc_url=params[:doc_url]
  @subject=params[:subject]
   num_emails_sent = 0
   begin
     
   mail_info = { "from_name" => "VIGOR" , "from_email" => "Vegetarian Information Group of Rochester <friends@vigr.org>", "message" => @message, "subject" => @subject, "doc_url" => @doc_url}
   #Call the Notifier class and send the email
      friend_list = Friend.find_by_sql("select distinct A.email, A.fname from friends A join lists B where A.id = B.friend_id and B.list_cat_id = #{@list_cat_id}" ) 
             for each_friend in friend_list 
          if each_friend[:email] =~ /^[a-zA-Z0-9._%-]+@(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]{2,4}$/ then 
            mail_info["recipients"] = each_friend[:email] 
            if each_friend[:fname].size >= 1 then mail_info["name"] = each_friend[:fname] 
               else mail_info["name"] = "VIGOR friend" 
            end
            if can? :manage, Friend then 
              Notifier.deliver_multipart_list(mail_info)
              flash[:notice] = "Your message was successfully delivered.<br>The last email address sent successfully was #{each_friend[:email]}."
              num_emails_sent += 1
             end
            end
        end        

     flash[:notice] += "<br>A total of #{num_emails_sent} emails were sent."
     redirect_to(:controller => "home")  
  rescue
  #if everything fails, display a warning and the exception
  #Maybe not always advisable if your app is public
  #But good for debugging, especially if action mailer is setup wrong
  flash[:warning] = "At least one of the email recipients could not be delivered to at this time. #$!. Please try again later."
  flash[:warning] += "<br>A total of #{num_emails_sent} emails were sent successfully."
   redirect_to(:controller => "home")
   end

  end
  
  private

  def resolve_layout
    case action_name
    when "index"
      "home"
    else
      "application"
    end
  end


end

