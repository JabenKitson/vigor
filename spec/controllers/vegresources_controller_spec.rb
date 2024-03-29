require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe VegresourcesController do

  # This should return the minimal set of attributes required to create a valid
  # Vegresource. As you add validations to Vegresource, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "type" => "" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # VegresourcesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all vegresources as @vegresources" do
      vegresource = Vegresource.create! valid_attributes
      get :index, {}, valid_session
      assigns(:vegresources).should eq([vegresource])
    end
  end

  describe "GET show" do
    it "assigns the requested vegresource as @vegresource" do
      vegresource = Vegresource.create! valid_attributes
      get :show, {:id => vegresource.to_param}, valid_session
      assigns(:vegresource).should eq(vegresource)
    end
  end

  describe "GET new" do
    it "assigns a new vegresource as @vegresource" do
      get :new, {}, valid_session
      assigns(:vegresource).should be_a_new(Vegresource)
    end
  end

  describe "GET edit" do
    it "assigns the requested vegresource as @vegresource" do
      vegresource = Vegresource.create! valid_attributes
      get :edit, {:id => vegresource.to_param}, valid_session
      assigns(:vegresource).should eq(vegresource)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Vegresource" do
        expect {
          post :create, {:vegresource => valid_attributes}, valid_session
        }.to change(Vegresource, :count).by(1)
      end

      it "assigns a newly created vegresource as @vegresource" do
        post :create, {:vegresource => valid_attributes}, valid_session
        assigns(:vegresource).should be_a(Vegresource)
        assigns(:vegresource).should be_persisted
      end

      it "redirects to the created vegresource" do
        post :create, {:vegresource => valid_attributes}, valid_session
        response.should redirect_to(Vegresource.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved vegresource as @vegresource" do
        # Trigger the behavior that occurs when invalid params are submitted
        Vegresource.any_instance.stub(:save).and_return(false)
        post :create, {:vegresource => { "type" => "invalid value" }}, valid_session
        assigns(:vegresource).should be_a_new(Vegresource)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Vegresource.any_instance.stub(:save).and_return(false)
        post :create, {:vegresource => { "type" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested vegresource" do
        vegresource = Vegresource.create! valid_attributes
        # Assuming there are no other vegresources in the database, this
        # specifies that the Vegresource created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Vegresource.any_instance.should_receive(:update_attributes).with({ "type" => "" })
        put :update, {:id => vegresource.to_param, :vegresource => { "type" => "" }}, valid_session
      end

      it "assigns the requested vegresource as @vegresource" do
        vegresource = Vegresource.create! valid_attributes
        put :update, {:id => vegresource.to_param, :vegresource => valid_attributes}, valid_session
        assigns(:vegresource).should eq(vegresource)
      end

      it "redirects to the vegresource" do
        vegresource = Vegresource.create! valid_attributes
        put :update, {:id => vegresource.to_param, :vegresource => valid_attributes}, valid_session
        response.should redirect_to(vegresource)
      end
    end

    describe "with invalid params" do
      it "assigns the vegresource as @vegresource" do
        vegresource = Vegresource.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Vegresource.any_instance.stub(:save).and_return(false)
        put :update, {:id => vegresource.to_param, :vegresource => { "type" => "invalid value" }}, valid_session
        assigns(:vegresource).should eq(vegresource)
      end

      it "re-renders the 'edit' template" do
        vegresource = Vegresource.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Vegresource.any_instance.stub(:save).and_return(false)
        put :update, {:id => vegresource.to_param, :vegresource => { "type" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested vegresource" do
      vegresource = Vegresource.create! valid_attributes
      expect {
        delete :destroy, {:id => vegresource.to_param}, valid_session
      }.to change(Vegresource, :count).by(-1)
    end

    it "redirects to the vegresources list" do
      vegresource = Vegresource.create! valid_attributes
      delete :destroy, {:id => vegresource.to_param}, valid_session
      response.should redirect_to(vegresources_url)
    end
  end

end
