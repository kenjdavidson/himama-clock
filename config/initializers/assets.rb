# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
Rails.application.config.assets.paths << Rails.root.join('node_modules/bootstrap-icons/font')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.configure do |env|
  # Annoying issue with running on Windows subsystem with folders being non-case
  # sensitive.  The resolution provided by https://github.com/rails/sprockets/issues/283
  # caused some other issues with permissions, so let's just use a MemoryStore
  # for now.
  env.cache = Sprockets::Cache::MemoryStore.new
end
