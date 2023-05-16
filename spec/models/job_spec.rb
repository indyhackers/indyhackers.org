require "rails_helper"

RSpec.describe Job do
  describe "::active" do
    it "only includes jobs that are published and active" do
      unpublished_job = create(:job, :unpublished)
      future_published_job = create(:job, :published_in_future)
      published_job = create(:job, :published)
      no_longer_active_job = create(:job, :no_longer_active)

      results = Job.active

      expect(results).to include(published_job)
      expect(results).not_to include(unpublished_job)
      expect(results).not_to include(future_published_job)
      expect(results).not_to include(no_longer_active_job)
    end
  end

  describe "::expired" do
    it "only includes jobs that are expired" do
      unpublished_job = create(:job, :unpublished)
      future_published_job = create(:job, :published_in_future)
      published_job = create(:job, :published)
      no_longer_active_job = create(:job, :no_longer_active)

      results = Job.expired

      expect(results).not_to include(published_job)
      expect(results).not_to include(unpublished_job)
      expect(results).not_to include(future_published_job)
      expect(results).to include(no_longer_active_job)
    end
  end

  describe "::unpublished" do
    it "only includes jobs that are unpublished" do
      unpublished_job = create(:job, :unpublished)
      future_published_job = create(:job, :published_in_future)
      published_job = create(:job, :published)
      no_longer_active_job = create(:job, :no_longer_active)

      results = Job.unpublished

      expect(results).not_to include(published_job)
      expect(results).to include(unpublished_job)
      expect(results).not_to include(future_published_job)
      expect(results).not_to include(no_longer_active_job)
    end
  end

  describe "#name" do
    it "returns the job title and company" do
      job = build(:job)
      expect(job.name).to include(job.title)
      expect(job.company).to include(job.company)
    end
  end

  describe "#name_changed?" do
    it "is true if the job title has changed" do
      job = create(:job)
      job.title = "New fancier title"
      expect(job.name_changed?).to be_truthy
    end

    it "is true if the job company has changed" do
      job = create(:job)
      job.company = "New fancier company name"
      expect(job.name_changed?).to be_truthy
    end
  end

  describe "#notify_if_published" do
    it "sends an email if the job was just published" do
      user = create(:user)
      job = create(:job, :unpublished, user: user)
      mail_double = double
      allow(mail_double).to receive(:deliver_now)

      expect(SystemMailer).to receive(:job_post_published).with(user, job).and_return(mail_double)
      job.published_at = 5.seconds.ago
      job.save!
    end
  end

  describe "#increment_views" do
    it "when not yet viewied, sets the job views to 1" do
      published_job = build(:job, :published)
      expect(published_job.views).to be_nil
      published_job.increment_views
      expect(published_job.views).to eq(1)
    end

    it "when viewed previously, increments the job's views" do
      published_job = build(:job, :published, views: 1)
      expect(published_job.views).to eq(1)
      published_job.increment_views
      expect(published_job.views).to eq(2)
    end
  end
end
