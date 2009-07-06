# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_HighFive_session',
  :secret      => 'deb429239e985572ff83f3d02ce635065f662e2085fc44b5853dded70b08d42834b46746c03dc5e1b414792a1a78670364d0f7004d0d58113390e21a01a01e99'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
