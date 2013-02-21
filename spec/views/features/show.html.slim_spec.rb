require 'spec_helper'

describe "features/show.html.slim" do
  before(:each) do
    @feature = assign(:feature, stub_model(Feature,
      :title => "Title",
      :description => "MyText",
      :user => nil,
      :project => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
