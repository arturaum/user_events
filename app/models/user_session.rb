class UserSession < Authlogic::Session::Base
  # Brute Force Protection
  consecutive_failed_logins_limit 10
end
