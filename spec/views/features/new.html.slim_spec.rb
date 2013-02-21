require 'spec_helper'

describe "features/new.html.slim" do
  before(:each) do
    assign(:feature, stub_model(Feature,
      :title => "MyString",
      :description => "MyText",
      :user => nil,
      :project => nil
    ).as_new_record)
  end

  it "renders new feature form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => features_path, :method => "post" do
      assert_select "input#feature_title", :name => "feature[title]"
      assert_select "textarea#feature_description", :name => "feature[description]"
      assert_select "input#feature_user", :name => "feature[user]"
      assert_select "input#feature_project", :name => "feature[project]"
    end
  end
end
