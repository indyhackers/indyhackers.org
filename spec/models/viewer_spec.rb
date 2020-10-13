require 'rails_helper'

RSpec.describe Viewer do
  it "should return true if the viewer has viewed the given job" do
    job = create(:job)
    viewer = create(:viewer)
    viewer.jobs << job
    expect(viewer.viewed?(job)).to eq true
  end

  it "should return false if the viewer has not viewed the given job" do
    job = create(:job)
    viewer = create(:viewer)
    expect(viewer.viewed?(job)).to eq false
  end
end
