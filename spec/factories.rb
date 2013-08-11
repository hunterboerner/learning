FactoryGirl.define do
	factory :user do
		name                  "Theron Boerner"
		email                 "theron@example.com"
		password              "foobar"
		password_confirmation "foobar"
	end 
end