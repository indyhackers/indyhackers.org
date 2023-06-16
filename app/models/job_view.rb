class JobView < ActiveRecord::Base
  belongs_to :job
  belongs_to :viewer
end
