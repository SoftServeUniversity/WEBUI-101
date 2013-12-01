require 'spec_helper'

describe VersionsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'revert'" do
    it "returns http success" do
      get 'revert'
      response.should be_success
    end
  end

end
