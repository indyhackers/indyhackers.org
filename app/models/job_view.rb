class JobView < ActiveRecord::Base
  belongs_to :job, dependent: :destroy
  belongs_to :viewer
end
