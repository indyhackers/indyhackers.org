require 'rails_helper'

RSpec.describe Job do
  context "#active" do
    it "only includes jobs that are published and active" do
      @unpublished_job = create(:job, :unpublished)
      @future_published_job = create(:job, :published_in_future)
      @published_job = create(:job, :published)
      @no_longer_active_job = create(:job, :no_longer_active)

      results = Job.active

      expect(results).to include(@published_job)
      expect(results).not_to include(@unpublished_job)
      expect(results).not_to include(@future_published_job)
      expect(results).not_to include(@no_longer_active_job)
    end
  end
end
