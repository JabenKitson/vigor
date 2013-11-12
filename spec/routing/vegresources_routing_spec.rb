require "spec_helper"

describe VegresourcesController do
  describe "routing" do

    it "routes to #index" do
      get("/vegresources").should route_to("vegresources#index")
    end

    it "routes to #new" do
      get("/vegresources/new").should route_to("vegresources#new")
    end

    it "routes to #show" do
      get("/vegresources/1").should route_to("vegresources#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vegresources/1/edit").should route_to("vegresources#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vegresources").should route_to("vegresources#create")
    end

    it "routes to #update" do
      put("/vegresources/1").should route_to("vegresources#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vegresources/1").should route_to("vegresources#destroy", :id => "1")
    end

  end
end
