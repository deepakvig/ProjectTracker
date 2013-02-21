require 'spec_helper'

describe "invitations/show.html.slim" do
  before(:each) do
    @invitation = assign(:invitation, stub_model(Invitation,
      :email => "Email",
      :project => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Email/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
