class ParticipateMailer < ActionMailer::Base
  default :from => 'kuznetsov@mystand.ru' #'ed@admlr.lipetsk.ru' #TODO уточнить

  def info_mail params
    @body = params[:body]
    mail :to => params[:email], :subject => params[:subject]
  end

  def request_mail params
    @email = params[:email]
    @full_name = params[:fullName]
    @organization = params[:organization]
    @request = params[:request]
    @body = "
    #{t('messages.mail_from.email')}: #{@email}
    #{t('messages.mail_from.full_name')}: #{@full_name}
    #{t('messages.mail_from.organization')}: #{@organization}
    #{t('messages.mail_from.request_to')}: #{@request}"
    mail :from => @email, :to => 'lipetsk-info@mailforspam.com', :subject => t('messages.mail_from.subject'), :body => @request
  end
end