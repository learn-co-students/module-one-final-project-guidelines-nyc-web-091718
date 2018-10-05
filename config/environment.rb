require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'app'

# DISABLES ACTIVERECORD MESSAGES
old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil
# TO RE ENABLE:
## ActiveRecord::Base.logger = old_logger
