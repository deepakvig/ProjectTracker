require 'spec_helper'

describe "comments/show.html.slim" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :description => "MyText",
      :user => nil,
      :feature => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
