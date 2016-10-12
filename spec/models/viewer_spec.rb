require 'spec_helper'

describe Viewer do
  it "should return true if the viewer has viewed the given job" do
    @job = FactoryGirl.create(:job)
    @viewer = FactoryGirl.create(:viewer)
    @viewer.jobs << @job
    expect(@viewer.viewed?(@job)).to eq true
  end

  it "should return false if the viewer has not viewed the given job" do
    @job = FactoryGirl.create(:job)
    @viewer = FactoryGirl.create(:viewer)
    expect(@viewer.viewed?(@job)).to eq false
  end
end
