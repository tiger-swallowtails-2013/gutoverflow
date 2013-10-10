require 'spec_helper'

describe PostsController do
  describe "GET #new" do
    it "renders new" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "with valid input" do
      it "redirects to show" do
        post :create, :post => {text: "Yahoo", user_id: 0}
        expect(response).to redirect_to("show")
      end
    end
    context "with invalid input" do
      it "re-renders new" do
        post :create, :post => {text: "", user_id: 0}
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET #show" do
    it "renders show" do
      # post :create, :post => {text: "ds", user_id: 0}
      get :show, id: 0
      expect(response).to render_template("show")
    end
  end

  describe "GET #index" do
    it "renders index" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
