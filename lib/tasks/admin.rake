namespace :admin do
  desc 'Remove stale jobs (and dependents)'
  task :sweep_jobs => :environment do
    Job.stale.destroy_all
  end  
end