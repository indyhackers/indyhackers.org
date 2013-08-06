if Rails.env.production?
  IndyhackersRails::Application.config.secret_token = ENV['OMG_SECRET_TOKEN']
else
  IndyhackersRails::Application.config.secret_token = '4ef7f3c920e2aade871b21082bb5ad5fadf5e35bd9b0997f05c2705d2891f658c3f88565ca6d0232ea224c68a5a3d50c3d73089deed21b9eee49f06058fd6b71'
end
