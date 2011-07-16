require 'spec_helper'

describe IndexController do
  
  context "GET index" do
    
    before(:each) do
      get :index
    end
    
    it "should render index view" do
      response.should render_template("index")
    end
    
    it "should be successful" do
      response.should be_success
    end
    
  end
    
end