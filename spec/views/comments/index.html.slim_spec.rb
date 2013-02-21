require 'spec_helper'

describe "comments/index.html.slim" do
  before(:each) do
    assign(:comments, [
      stub_model(Comment,
        :description => "MyText",
        :user => nil,
        :feature => nil
      ),
      stub_model(Comment,
        :description => "MyText",
        :user => nil,
        :feature => nil
      )
    ])
  end

  it "renders a list of comments" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
