require 'spec_helper'

describe UploadsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    let(:datafile) { Rack::Test::UploadedFile.new(Rails.root.join('example_input.tab')) }

    it "returns http success" do
      post 'create', { :datafile => datafile }
      response.should redirect_to(new_upload_path)
    end

    it "creates new purchases" do
      expect {
        post 'create', { :datafile => datafile }
      }.to change(Purchase, :count).by(4)
    end
  end

end
