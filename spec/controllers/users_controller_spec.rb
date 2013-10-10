require 'spec_helper'

describe UsersController do
  let(:valid_params) { {:user => FactoryGirl.attributes_for(:user)} }
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
    context "with valid attributes" do
      it "redirects to the :show page" do
        post :create, valid_params
        expect(response).to redirect_to user_path User.last
      end
    end
  end

  describe "Get #show" do
      let (:fake_user) {FactoryGirl.create(:user)}
    it "assigns @user" do
      get :show, id: fake_user
      expect(assigns(:user)).to eq(fake_user)
    end

    it "renders user :show profile page" do
      get 'show', id: fake_user
      expect(response).to render_template(:show)
    end
  end
end

__END__
https://github.com/rails/rails/tree/797fcdf738a2a2772544731027d4fc5ca9d358bc/actionpack/lib/action_view/helpers