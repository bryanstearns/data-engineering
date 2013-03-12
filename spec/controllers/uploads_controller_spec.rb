require 'spec_helper'

describe UploadsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "returns http success" do
      post 'create'
      response.should redirect_to(new_upload_path)
    end
  end

end
