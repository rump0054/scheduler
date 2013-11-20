require 'spec_helper'

describe UserSchedule do
	let(:user) { FactoryGirl.create(:user) }

	before do
		date = DateTime.new(2013, 11, 1)
		@schedule = UserSchedule.new(begin_date: date, end_date: date.advance(:days => 29), user_id: user.id)
	end

	subject { @schedule }

	it { should respond_to(:begin_date) }
	it { should respond_to(:end_date) }
	it { should respond_to(:user) }
	it { should be_valid }

	describe "when user_id is not present" do
		before { @schedule.user_id = nil }
		it { should_not be_valid }
	end

	describe "when begin_date is not present" do
		before { @schedule.begin_date = nil }
		it { should_not be_valid }
	end

	describe "when end_date is not present" do
		before { @schedule.end_date = nil }
		it { should_not be_valid }
	end

	describe "when end_date is before begin_date" do
		before { @schedule.begin_date = @schedule.end_date.advance(:days => 1) }
		it { should_not be_valid }
	end

	describe "when begin_date and end_date are the same" do
		before { @schedule.end_date = @schedule.begin_date }
		it { should be_valid }
	end
end