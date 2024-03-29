class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end
#uses_tiny_mce(:options => {:theme => 'advanced',
#                           :browsers => %w{msie gecko},
#                           :theme_advanced_toolbar_location => "top",
#                           :theme_advanced_toolbar_align => "left",
#                           :theme_advanced_resizing => true,
#                           :theme_advanced_resize_horizontal => false,
#                           :paste_auto_cleanup_on_paste => true,
#                           :theme_advanced_buttons1 => %w{formatselect fontselect fontsizeselect bold italic underline strikethrough separator justifyleft justifycenter justifyright indent outdent separator bullist
#numlist forecolor backcolor separator link unlink image undo redo},
#                           :theme_advanced_buttons2 => [],
#                           :theme_advanced_buttons3 => [],
#                           :plugins => %w{contextmenu paste}},
#              :only => [:new, :edit, :show, :index, :contact, :contribute, :copy])

end
