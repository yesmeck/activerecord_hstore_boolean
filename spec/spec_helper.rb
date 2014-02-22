require 'active_record'
require 'activerecord_hstore_boolean'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'

  config.before :suite do
    create_database
  end
end


def create_database
  ActiveRecord::Base.establish_connection(
    adapter: 'postgresql',
    database: 'activerecord_hstore_boolean_test',
    username: 'postgres'
  )

  ActiveRecord::Base.connection.execute('CREATE EXTENSION hstore;') rescue ActiveRecord::StatementInvalid
  ActiveRecord::Base.connection.execute('DROP TABLE IF EXISTS products;')

  ActiveRecord::Base.connection.create_table(:products) do |t|
    t.hstore :properties
  end
end
