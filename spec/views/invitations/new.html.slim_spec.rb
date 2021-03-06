require 'spec_helper'

describe "invitations/new.html.slim" do
  before(:each) do
    assign(:invitation, stub_model(Invitation,
      :email => "MyString",
      :project => nil
    ).as_new_record)
  end

  it "renders new invitation form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => invitations_path, :method => "post" do
      assert_select "input#invitation_email", :name => "invitation[email]"
      assert_select "input#invitation_project", :name => "invitation[project]"
    end
  end
end
