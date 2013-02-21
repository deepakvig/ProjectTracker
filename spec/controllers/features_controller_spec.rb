require 'spec_helper'

describe FeaturesController do

  def mock_feature(stubs={})
    (@mock_feature ||= mock_model(Feature).as_null_object).tap do |feature|
      feature.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all features as @features" do
      Feature.stub(:all) { [mock_feature] }
      get :index
      assigns(:features).should eq([mock_feature])
    end
  end

  describe "GET show" do
    it "assigns the requested feature as @feature" do
      Feature.stub(:find).with("37") { mock_feature }
      get :show, :id => "37"
      assigns(:feature).should be(mock_feature)
    end
  end

  describe "GET new" do
    it "assigns a new feature as @feature" do
      Feature.stub(:new) { mock_feature }
      get :new
      assigns(:feature).should be(mock_feature)
    end
  end

  describe "GET edit" do
    it "assigns the requested feature as @feature" do
      Feature.stub(:find).with("37") { mock_feature }
      get :edit, :id => "37"
      assigns(:feature).should be(mock_feature)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created feature as @feature" do
        Feature.stub(:new).with({'these' => 'params'}) { mock_feature(:save => true) }
        post :create, :feature => {'these' => 'params'}
        assigns(:feature).should be(mock_feature)
      end

      it "redirects to the created feature" do
        Feature.stub(:new) { mock_feature(:save => true) }
        post :create, :feature => {}
        response.should redirect_to(feature_url(mock_feature))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved feature as @feature" do
        Feature.stub(:new).with({'these' => 'params'}) { mock_feature(:save => false) }
        post :create, :feature => {'these' => 'params'}
        assigns(:feature).should be(mock_feature)
      end

      it "re-renders the 'new' template" do
        Feature.stub(:new) { mock_feature(:save => false) }
        post :create, :feature => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested feature" do
        Feature.should_receive(:find).with("37") { mock_feature }
        mock_feature.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :feature => {'these' => 'params'}
      end

      it "assigns the requested feature as @feature" do
        Feature.stub(:find) { mock_feature(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:feature).should be(mock_feature)
      end

      it "redirects to the feature" do
        Feature.stub(:find) { mock_feature(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(feature_url(mock_feature))
      end
    end

    describe "with invalid params" do
      it "assigns the feature as @feature" do
        Feature.stub(:find) { mock_feature(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:feature).should be(mock_feature)
      end

      it "re-renders the 'edit' template" do
        Feature.stub(:find) { mock_feature(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested feature" do
      Feature.should_receive(:find).with("37") { mock_feature }
      mock_feature.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the features list" do
      Feature.stub(:find) { mock_feature }
      delete :destroy, :id => "1"
      response.should redirect_to(features_url)
    end
  end

end