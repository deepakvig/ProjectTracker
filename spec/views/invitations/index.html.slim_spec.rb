require 'spec_helper'

describe "invitations/index.html.slim" do
  before(:each) do
    assign(:invitations, [
      stub_model(Invitation,
        :email => "Email",
        :project => nil
      ),
      stub_model(Invitation,
        :email => "Email",
        :project => nil
      )
    ])
  end

  it "renders a list of invitations" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
