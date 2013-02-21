require 'spec_helper'

describe "comments/new.html.slim" do
  before(:each) do
    assign(:comment, stub_model(Comment,
      :description => "MyText",
      :user => nil,
      :feature => nil
    ).as_new_record)
  end

  it "renders new comment form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => comments_path, :method => "post" do
      assert_select "textarea#comment_description", :name => "comment[description]"
      assert_select "input#comment_user", :name => "comment[user]"
      assert_select "input#comment_feature", :name => "comment[feature]"
    end
  end
end
