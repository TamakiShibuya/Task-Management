require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  before do
    FactoryBot.create(:user) do |user|
      FactoryBot.create_list(:task, 2, user: user)
    end
  end

  # describe "GET #new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "GET #index" do 
    # it "returns http success" do
    #   get :index
    #   expect(response).to have_http_status(:success)
    # end
    it ''
  end

end