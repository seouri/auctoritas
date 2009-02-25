# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_auctoritas_session',
  :secret      => 'c036c433ef489cdb2424401d1652a0a583af31e6f36b1af3f2f6f30d9476d48b6ef48cdb24121324d7985080ff8169d131a12d4143a018f27f273a197c70a77d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
