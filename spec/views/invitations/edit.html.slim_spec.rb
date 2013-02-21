require 'spec_helper'

describe "invitations/edit.html.slim" do
  before(:each) do
    @invitation = assign(:invitation, stub_model(Invitation,
      :new_record? => false,
      :email => "MyString",
      :project => nil
    ))
  end

  it "renders the edit invitation form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => invitation_path(@invitation), :method => "post" do
      assert_select "input#invitation_email", :name => "invitation[email]"
      assert_select "input#invitation_project", :name => "invitation[project]"
    end
  end
end
