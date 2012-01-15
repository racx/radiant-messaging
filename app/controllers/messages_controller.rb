class MessagesController < ApplicationController
  no_login_required
  skip_before_filter :verify_authenticity_token
  
  def create
    @message = Message.create(:body => params[:message_body], :member_id => session[:member_id])
    
    redirect_to request.referer
  end
  
  private
  
  def current_member
    Member.find(session[:member_id])
  end

end

