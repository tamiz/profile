class UserNotifierMailer < ApplicationMailer

  default :from => 'profileapp@gmail.com'

  def user_notifier_mailer(user)
    @user = user
    mail( :to => @user.email,
     :subject => 'thanxs for signing up' )
  end
end


