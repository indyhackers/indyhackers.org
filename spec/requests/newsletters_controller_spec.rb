require "rails_helper"

RSpec.describe NewslettersController do
  describe "/newsletters" do
    it "renders the page" do
      get "/newsletter"

      expect(response).to be_successful
    end
  end

  describe "/newsletters/archive" do
    it "renders the page" do
      get "/newsletter/archive"

      expect(response).to be_successful
    end
  end

  describe "/newsletter/subscribe" do
    it "redirects the user" do
      get "/newsletter/subscribe"

      expect(response).to redirect_to("http://eepurl.com/sMpJj")
    end
  end
end
