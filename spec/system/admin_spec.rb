require "rails_helper"

RSpec.describe "Admin feature" do
  it "allows an admin to log in" do
    admin = create(:admin)
    visit new_admin_session_path
    fill_in "Email", with: admin.email
    fill_in "Password", with: "password"
    click_on "Sign in"

    expect(page).to have_text("Signed in successfully")
  end

  it "allows an admin create a job post" do
    admin = create(:admin)
    visit new_admin_session_path
    fill_in "Email", with: admin.email
    fill_in "Password", with: "password"
    click_on "Sign in"

    title = "A new job posting"
    company = "Corp Inc."
    description = "This job probably pays at least minimum wage"
    visit new_admin_job_path
    fill_in "Title", with: title
    fill_in "Company", with: company
    fill_in "Description", with: description

    expect do
      click_on "Save"
    end.to change(Job, :count).by(1)

    expect(page).to have_text(/success/)
    expect(page).to have_text(title.upcase)
    expect(page).to have_text(description)
  end

  it "allows an admin to edit a job post" do
    admin = create(:admin)
    job = create(:job, :published, user: create(:user))

    visit new_admin_session_path
    fill_in "Email", with: admin.email
    fill_in "Password", with: "password"
    click_on "Sign in"

    visit edit_admin_job_path(job)
    new_title = "#{job.title} - WE HAVE A PING PONG TABLE! DON'T YOU ALL LIKE PING PONG!?"
    fill_in "Title", with: new_title
    click_on "Save"

    expect(page).to have_text(/success/)
    expect(page).to have_text(new_title.upcase)
  end
end
