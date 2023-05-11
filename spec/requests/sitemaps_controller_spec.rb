require "rails_helper"

RSpec.describe SitemapsController do
  describe "GET /sitemap.xml" do
    it "Displays the sitemap" do
      published_job = create(:job, :published, title: "A published job")
      not_active_job = create(:job, :no_longer_active, title: "Not active job")

      get sitemap_path(format: :xml)

      expect(response).to have_http_status(:ok)
      expect(response.body).to include(job_url(published_job))
      expect(response.body).not_to include(job_url(not_active_job))
    end
  end
end
