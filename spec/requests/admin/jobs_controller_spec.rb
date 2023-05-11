require "rails_helper"

RSpec.describe Admin::JobsController do
  let(:admin) { create(:admin) }

  describe "#index" do
    before do
      create_list(:job, 2)
    end

    describe "when authenticated" do
      before do
        sign_in admin
      end

      it "renders the page" do
        get admin_jobs_path

        expect(response).to be_successful
      end
    end

    describe "when not authenticated" do
      it "asks the user to log in" do
        get admin_jobs_path

        expect(response).to redirect_to(new_admin_session_path)
      end
    end
  end

  describe "#show" do
    let(:job) { create(:job) }

    describe "when authenticated" do
      before do
        sign_in admin
      end

      it "renders the page" do
        get admin_job_path(job)

        expect(response).to be_successful
      end
    end

    describe "when not authenticated" do
      it "asks the user to log in" do
        get admin_job_path(job)

        expect(response).to redirect_to(new_admin_session_path)
      end
    end
  end

  describe "#new" do
    describe "when authenticated" do
      before do
        sign_in admin
      end

      it "renders the page" do
        get new_admin_job_path

        expect(response).to be_successful
      end
    end

    describe "when not authenticated" do
      it "asks the user to log in" do
        get new_admin_job_path

        expect(response).to redirect_to(new_admin_session_path)
      end
    end
  end

  describe "#create" do
    let(:job_params) do
      {
        title: Faker::Lorem.words.join(" "),
        company: Faker::Company.name,
        description: Faker::Lorem.paragraphs.join
      }
    end

    describe "when authenticated" do
      before do
        sign_in admin
      end

      it "creates a record" do
        expect do
          post admin_jobs_path, params: { job: job_params }
        end.to change(Job, :count).by(1)

        new_job = Job.last
        expect(response).to redirect_to(admin_job_path(new_job))
      end
    end

    describe "when not authenticated" do
      it "asks the user to log in" do
        expect do
          post admin_jobs_path, params: { job: job_params }
        end.to change(Job, :count).by(0)

        expect(response).to redirect_to(new_admin_session_path)
      end
    end
  end

  describe "#update" do
    let(:job) { create(:job) }
    let(:job_params) do
      {
        title: "New title"
      }
    end

    describe "when authenticated" do
      before do
        sign_in admin
      end

      it "updates a record" do
        patch admin_job_path(job), params: { job: job_params }

        job.reload
        expect(job.title).to eq("New title")

        expect(response).to redirect_to(job_path(job))
      end
    end

    describe "when not authenticated" do
      it "asks the user to log in" do
        patch admin_job_path(job), params: { job: job_params }

        expect(response).to redirect_to(new_admin_session_path)
      end
    end
  end

  describe "#destroy" do
    let!(:job) { create(:job) }

    describe "when authenticated" do
      before do
        sign_in admin
      end

      it "deletes a record" do
        expect do
          delete admin_job_path(job)
        end.to change(Job, :count).by(-1)

        expect(response).to redirect_to(admin_jobs_path)
      end
    end

    describe "when not authenticated" do
      it "asks the user to log in" do
        expect do
          delete admin_job_path(job)
        end.to change(Job, :count).by(0)

        expect(response).to redirect_to(new_admin_session_path)
      end
    end
  end
end
