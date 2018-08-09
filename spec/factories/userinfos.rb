FactoryGirl.define do
  factory :userinfo do
	after :create do |b|
	  b.update_column(:driving_license, "/spec/fixtures/myfiles/test_image1.png")
	end
	after :create do |b|
	  b.update_column(:vehicle_registration_card, "/spec/fixtures/myfiles/test_image2.png")
	end
  end
end