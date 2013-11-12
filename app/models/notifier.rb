class Notifier < ActionMailer::Base
  #belongs_to :home
  def multipart_contact(mail_info)
     
        @from = mail_info["from_email"]
        @recipients = "friends@vigr.org"
        @subject = mail_info["subject"]
        @mail_info = mail_info
        @body["mail_info"] = mail_info
        @sent_on = Time.now
    
   part :content_type => "text/html",
   :body => render_message("multipart_contact_html", "mail_info" => mail_info)


   #part :content_type => "text/plain",
   #:body => render_message("multipart_contact_plain", "mail_info" => mail_info)
    
   end

  def multipart_pay(mail_info)
     
        @from = mail_info["from_email"]
        @recipients = "friends@vigr.org"
        @subject = mail_info["subject"]
        @mail_info = mail_info
        @body["mail_info"] = mail_info
        @sent_on = Time.now
    
   part :content_type => "text/html",
   :body => render_message("multipart_pay_html", "mail_info" => mail_info) 

   #part :content_type => "text/plain",
   #:body => render_message("multipart_pay_plain", "mail_info" => mail_info) 
    
  end
  
   def multipart_list(mail_info)
        
        @list_cat_id = mail_info["list_cat_id"]
        @from = mail_info["from_email"]
        @recipients = mail_info["recipients"]       
        @subject = mail_info["subject"]
        @mail_info = mail_info
        @body["mail_info"] = mail_info
        @sent_on = Time.now
    
   part :content_type => "text/html",
   :body => render_message("multipart_list_html", "mail_info" => mail_info) 

   #part :content_type => "text/plain",
   #:body => render_message("multipart_pay_plain", "mail_info" => mail_info) 
    
   end

end