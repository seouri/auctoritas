# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_t_session',
  :secret      => 'f011309d4801d1ab3d96bd8a6616ce77e4f2171a0219dedc6906c858e8c8e6c2a685226fca2b61f191b53d079d20cfd9edd85c7e35e208fefcb57256da6d947a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
