require "rails_helper"

RSpec.describe "ViewingJobs" do
  describe "GET /jobs" do
    it "Displays active jobs" do
      published_job = create(:job, :published, title: "A published job")
      not_active_job = create(:job, :no_longer_active, title: "Not active job")

      get jobs_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include(published_job.title)
      expect(response.body).not_to include(not_active_job.title)
    end
  end
end
