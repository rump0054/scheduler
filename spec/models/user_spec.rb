require 'spec_helper'

describe User do
  before { @user = User.new(email: 'erumppe@gmail.com', password: 'blueboy1', first_name: 'Example', last_name: 'User') }

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:schedules) }

  it { should be_valid }

  describe "when email is not present" do
    before { @user.email = '' }
    it { should_not be_valid }
  end

  describe "when first_name is not present" do
    before { @user.first_name = '' }
    it { should_not be_valid }
  end

  describe "when last_name is not present" do
    before { @user.last_name = '' }
    it { should_not be_valid }
  end

  describe "when email is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end

    it { should_not be_valid }
  end
end