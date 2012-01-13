INSTRUMENTAL = Instrumental::Agent.new('8a824271ba28d8f5744ac0f50760c9fb', :enabled => Rails.env.production?)
INSTRUMENTAL.increment('initialized')
