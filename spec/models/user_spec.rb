require 'spec_helper'
#need to close loop on describe user each with the before. Second test isn't recognising
describe User do

  before :each do
    @user = User.new(name: "Example User", email: "example@example.com")
  end

describe "when email is not present" do
  before {@user.email = " "}
  it { should_not be_valid }
end

describe "when name is not present" do
  before { @user.name = " "}
  it { should_not be_valid}
end

describe "when name is too long" do
  before {@user.name = "a" * 100}
  it { should_not be_valid }
end

describe "when email format is invalid" do
  addresses = %w[hello@example,com user_at_foo.org example@user.foo. foobar@baz_bar.com]
  addresses.each do |invalid_address|
  before {@user.email = invalid_address}
  it { should_not be_valid }
end
end
end
