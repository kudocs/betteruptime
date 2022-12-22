# [Betteruptime]

A simple way to configure betteruptime healthcheck in Rails applications

# frozen_string_literal: true

```
Betteruptime.configure do |config|
  config.api_token = 'xxxxxxx'
  config.verbose = false

  # -- Checks --
  # config.add_job :database,     -> { ActiveRecord::Base.connection.execute('select 1') }
  # config.add_job :migrations,   -> { ActiveRecord::Migration.check_pending! }
  # config.add_job :cache,        -> { Rails.cache.read('some_key') }
  # config.add_job :environments, -> { Dotenv.require_keys('ENV_NAME', 'ANOTHER_ENV') }
end
```
