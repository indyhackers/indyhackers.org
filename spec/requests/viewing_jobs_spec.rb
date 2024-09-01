require "rails_helper"

RSpec.describe "ViewingJobs" do
  describe "GET /jobs" do
    it "displays active jobs" do
      published_job = create(:job, :published, title: "A published job")
      not_active_job = create(:job, :no_longer_active, title: "Not active job")

      get jobs_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include(published_job.title)
      expect(response.body).not_to include(not_active_job.title)
    end
  end

  describe "GET /jobs/:id" do
    it "displays the given job" do
      published_job = create(:job, :published, title: "A published job")
      not_active_job = create(:job, :no_longer_active, title: "Not active job")

      get job_path(published_job)

      expect(response).to have_http_status(:ok)
      expect(response.body).to include(published_job.title)
      expect(response.body).not_to include(not_active_job.title)
      expect(response.body).to include(published_job.description.split("\n").first)
    end

    it "increments views for the given job if it's the first time they're seeing the post" do
      published_job = create(:job, :published, title: "A published job")

      expect { get job_path(published_job) }.to change(JobView, :count).by(1)
      expect { get job_path(published_job) }.not_to change(JobView, :count)
    end
  end
end
