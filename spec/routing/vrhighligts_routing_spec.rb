require "spec_helper"

describe VrhighligtsController do
  describe "routing" do

    it "routes to #index" do
      get("/vrhighligts").should route_to("vrhighligts#index")
    end

    it "routes to #new" do
      get("/vrhighligts/new").should route_to("vrhighligts#new")
    end

    it "routes to #show" do
      get("/vrhighligts/1").should route_to("vrhighligts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vrhighligts/1/edit").should route_to("vrhighligts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vrhighligts").should route_to("vrhighligts#create")
    end

    it "routes to #update" do
      put("/vrhighligts/1").should route_to("vrhighligts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vrhighligts/1").should route_to("vrhighligts#destroy", :id => "1")
    end

  end
end
