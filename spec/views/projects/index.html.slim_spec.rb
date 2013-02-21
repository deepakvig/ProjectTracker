require 'spec_helper'

describe "projects/index.html.slim" do
  before(:each) do
    assign(:projects, [
      stub_model(Project,
        :title => "Title",
        :description => "MyText",
        :user => nil
      ),
      stub_model(Project,
        :title => "Title",
        :description => "MyText",
        :user => nil
      )
    ])
  end

  it "renders a list of projects" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
