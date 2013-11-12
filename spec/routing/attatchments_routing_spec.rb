require "spec_helper"

describe AttatchmentsController do
  describe "routing" do

    it "routes to #index" do
      get("/attatchments").should route_to("attatchments#index")
    end

    it "routes to #new" do
      get("/attatchments/new").should route_to("attatchments#new")
    end

    it "routes to #show" do
      get("/attatchments/1").should route_to("attatchments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/attatchments/1/edit").should route_to("attatchments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/attatchments").should route_to("attatchments#create")
    end

    it "routes to #update" do
      put("/attatchments/1").should route_to("attatchments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/attatchments/1").should route_to("attatchments#destroy", :id => "1")
    end

  end
end
