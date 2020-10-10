require "rails_helper"

RSpec.describe SiteController do
  describe "/" do
    it "renders the page" do
      get root_path

      expect(response).to be_successful
    end
  end

  describe "/about" do
    it "renders the page" do
      get "/about"

      expect(response).to be_successful
    end
  end

  describe "/calendar" do
    it "renders the page" do
      get "/calendar"

      expect(response).to be_successful
    end
  end

  describe "/code-of-conduct" do
    it "renders the page" do
      get "/code-of-conduct"

      expect(response).to be_successful
    end
  end

  describe "/coc" do
    it "renders the page" do
      get "/coc"

      expect(response).to be_successful
    end
  end
end
