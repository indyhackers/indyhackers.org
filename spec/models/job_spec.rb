require 'spec_helper'

describe Job do
  context "#stale" do
    it "scopes results to jobs older than 60 days" do
      @stale_job = FactoryGirl.create(:job, :created_at => 61.days.ago)
      @fresh_job = FactoryGirl.create(:job, :created_at => 59.day.ago)
      
      results = Job.stale
      results.should include(@stale_job)
      results.should_not include(@fresh_job)
    end
  end
end
