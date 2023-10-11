require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let!(:employee1) {create :user, name: "user1", address: "user1",email: "user1@mail",password: 123456}
    before(:each) do
      sign_in(employee1)
    end
    let!(:sample_post) {create :post, name: "post-one", user_id: employee1.id}
  
  describe "GET /index" do
    it 'get all posts' do
      get "/posts"
      expect(sample_post.name).to eq("post-one")
      expect(response).to have_http_status(200)
    end
 
    let(:valid_params) {{post: {name: "First Post", user_id: employee1.id}}}
    # it "create post" do
    #    post "/posts", params: valid_params
    #    expect(response).to have_http_status(200)
    # end

    it  "show post" do 
      get "/posts/#{sample_post.id}"
      expect(response).to have_http_status(200)
    end

    it "destroy posts" do
      delete "/posts/#{sample_post.id}"
      expect(response).to have_http_status(200)
      puts response.body
    end
    


  end
  describe "jhvfbdc" do 
    let (:user_post_params) {{post: {name: "csvfggvb"}}}
    it "kokhgd" do 
      VCR.use_cassette("post_upload") do
        post "/posts", params: user_post_params
        expect(response).to have_http_status(200)
      end
    end
  end
end
