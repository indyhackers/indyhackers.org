require 'spec_helper'

describe Viewer do
  it "should return true if the viewer has viewed the given job" do
    @job = Factory(:job)
    @viewer = Factory(:viewer)
    @viewer.jobs << @job
    @viewer.viewed?(@job).should == true
  end

  it "should return false if the viewer has not viewed the given job" do
    @job = Factory(:job)
    @viewer = Factory(:viewer)
    @viewer.viewed?(@job).should == false
  end
end
