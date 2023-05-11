require "rails_helper"

RSpec.describe Viewer do
  it "returns true if the viewer has viewed the given job" do
    job = create(:job)
    viewer = create(:viewer)
    viewer.jobs << job
    expect(viewer.viewed?(job)).to eq true
  end

  it "returns false if the viewer has not viewed the given job" do
    job = create(:job)
    viewer = create(:viewer)
    expect(viewer.viewed?(job)).to eq false
  end
end
