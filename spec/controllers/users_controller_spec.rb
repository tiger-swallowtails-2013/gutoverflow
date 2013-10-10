require 'spec_helper'

describe UsersController do
  describe "Get #new" do
    it "has a 200 status code" do
      get :new
      expect(response.status).to eq(200)
    end

    it "renders a :new user signup form" do
      get 'new'
      expect(response).to render_template(:new)
    end
  end

  describe "Post #create" do
    let(:valid_params) { {:user => FactoryGirl.attributes_for(:user)} }
    context "with valid attributes" do
      it "redirects to the :show page" do
        post :create, valid_params
        expect(response).to redirect_to(user_path)
      end
    end
  end

  describe "Get #show" do
    it "assigns @user"
  end
end

__END__
https://github.com/rails/rails/tree/797fcdf738a2a2772544731027d4fc5ca9d358bc/actionpack/lib/action_view/helpers