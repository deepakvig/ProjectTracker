require 'spec_helper'

describe "features/edit.html.slim" do
  before(:each) do
    @feature = assign(:feature, stub_model(Feature,
      :new_record? => false,
      :title => "MyString",
      :description => "MyText",
      :user => nil,
      :project => nil
    ))
  end

  it "renders the edit feature form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => feature_path(@feature), :method => "post" do
      assert_select "input#feature_title", :name => "feature[title]"
      assert_select "textarea#feature_description", :name => "feature[description]"
      assert_select "input#feature_user", :name => "feature[user]"
      assert_select "input#feature_project", :name => "feature[project]"
    end
  end
end
