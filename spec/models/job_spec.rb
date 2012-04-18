require 'spec_helper'

describe Job do
  it "should set a slug on creation" do
    @job = FactoryGirl.build(:job)
    @job.slug.should be_nil
    @job.save
    @job.slug.should_not be_nil
  end

  it "should escape all double hyphens in the slug" do
    @job = FactoryGirl.build(:job)
    @job.title = "some--slug--with-double-hyphens"
    @job.escaped_title.should == "some-slug-with-double-hyphens"
  end

  it "should escape a title for the slug" do
    @user = FactoryGirl.create(:user)
    @job = Job.create(
        :title => 'Javascript Developer (with a touch of backend)',
        :description => "Awesome thing",
        :user => @user
      )

    @job.slug.should == 'javascript-developer-with-a-touch-of-backend'
  end
end
