require 'digest/sha2'
class SignUpMailer < ApplicationMailer
  default "Message-ID"=>"#{Digest::SHA2.hexdigest(Time.now.to_i.to_s)}@gmail.com"
  def user_confirmation(user)
	@user = user
    mail to: @user.email, subject: "GoJek: Verify the Email"
  end
end
