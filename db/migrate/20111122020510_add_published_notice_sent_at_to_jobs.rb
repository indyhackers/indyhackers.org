class AddPublishedNoticeSentAtToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :published_notice_sent_at, :datetime
  end
end
