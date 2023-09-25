class JobPostRequest
  include ActiveModel::Validations
  include ActiveModel::Conversion

  attr_accessor :id, :name, :email, :title, :company, :salary, :description

  validates :name, :email, :title, :company, :description, presence: true

  def initialize(attributes = {})
    attributes.each do |key, value|
      send("#{key}=", value)
    end
  end

  def send!
    user = User.find_or_create_by!(name:, email:)
    job = Job.from_job_post_request(self)
    job.user = user
    job.save!
    SystemMailer.job_post_request(self, job).deliver_now
  end

  def save
    true
  end

  def persisted?
    false
  end
end
