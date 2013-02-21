require 'spec_helper'

describe "comments/edit.html.slim" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :new_record? => false,
      :description => "MyText",
      :user => nil,
      :feature => nil
    ))
  end

  it "renders the edit comment form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => comment_path(@comment), :method => "post" do
      assert_select "textarea#comment_description", :name => "comment[description]"
      assert_select "input#comment_user", :name => "comment[user]"
      assert_select "input#comment_feature", :name => "comment[feature]"
    end
  end
end
