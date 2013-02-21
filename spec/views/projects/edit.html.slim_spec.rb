require 'spec_helper'

describe "projects/edit.html.slim" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :new_record? => false,
      :title => "MyString",
      :description => "MyText",
      :user => nil
    ))
  end

  it "renders the edit project form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => project_path(@project), :method => "post" do
      assert_select "input#project_title", :name => "project[title]"
      assert_select "textarea#project_description", :name => "project[description]"
      assert_select "input#project_user", :name => "project[user]"
    end
  end
end
