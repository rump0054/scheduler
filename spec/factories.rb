FactoryGirl.define do
	factory :user do
		sequence(:email) { |n| "example#{n}@gmail.com" }
		password 'blueboy1'
		first_name 'Example'
		sequence(:last_name) { |n| "User#{n}" }
	end
end