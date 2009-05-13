# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_aquariumac_session',
  :secret      => 'fbccdf5e28444337d3ee44e202c616d406d704fbf2aede02c56e4ae364e90693b46b2f32177b64d965b4b0c200e32dbdf451ce820475c5df8cc89fb112efe984'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
