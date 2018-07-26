require "rails_helper"

RSpec.describe SignUpMailer, type: :mailer do
  describe "user_confirmation" do
    let(:mail) { SignUpMailer.user_confirmation }

    it "renders the headers" do
      expect(mail.subject).to eq("User confirmation")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
