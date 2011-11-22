class AddPublishedNoticeSentAtToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :published_notice_sent_at, :datetime
  end
end
