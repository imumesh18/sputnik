# Preview all emails at http://localhost:3000/rails/mailers/sign_up
class SignUpPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/sign_up/user_confirmation
  def user_confirmation
    SignUpMailer.user_confirmation
  end

end
