class MailerController < ApplicationController
  def protect_from_forgery
    #disable protect from forgercy
  end
  def authenticate_user!
    #disabled
  end
  def create
    params.permit :email, :subject, :body
    ParticipateMailer.info_mail(params).deliver!
    render :text => 'true'
  end

  def new
    params.permit :email, :organization, :name
    ParticipateMailer.request_mail(params).deliver!
    render :text => 'true'
  end
end
