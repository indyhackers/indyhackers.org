require "rails_helper"

RSpec.describe "Jobs feature" do
  it "allows a guest to view a job by clicking on one in the job list" do
    job = create(:job, :published, user: create(:user))

    visit jobs_path
    expect(page).to have_text(job.name)

    click_on job.name
    expect(page).to have_text(job.description)
  end

  it "allows a guest to request a job post" do
    visit jobs_path
    click_on "submit your job here"

    expect(page.current_url).to match(/#{new_job_post_request_path}/)

    fill_in "Name", with: "Bobby Tables"
    fill_in "Email", with: "bobby@droptables.com"
    fill_in "Title", with: "Advanced Injection Engineer"
    fill_in "Company", with: "Failure Biz"
    fill_in "Description", with: "Always check your user input'); DROP TABLE users; --"

    expect do
      click_on "Send"
    end.to change { ActionMailer::Base.deliveries.count }.by(1)

    expect(page).to have_text("Your job post request was sent successfully!")
  end

  it "allows a user to edit their published job post" do
    user = create(:user)
    job = create(:job, :published, user:)

    visit edit_job_path(job, token: user.token)

    new_title = "A job posting funtime good job"
    fill_in "Title", with: new_title, fill_options: { clear: :backspace }
    click_on "Update"

    job.reload

    expect(job.title).to eq(new_title)
    expect(page.current_url).to match(/#{job_path(job)}/)
    expect(page).to have_text("Your job post was updated")
  end

  it "allows a user to delete their published job post" do
    user = create(:user)
    job = create(:job, :published, user:)

    visit edit_job_path(job, token: user.token)

    expect do
      click_on "Delete"
    end.to change(Job, :count).by(-1)

    expect(page.current_url).to match(/#{jobs_path}/)
    expect(page).not_to have_text(job.title)
  end
end
