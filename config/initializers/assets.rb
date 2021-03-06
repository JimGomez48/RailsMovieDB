# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
BOWER_ASSET_PATH = Rails.root.join('vendor', 'assets', 'bower_components')
BOOTSTRAP_PATH = Rails.root.join(BOWER_ASSET_PATH, 'bootstrap-sass-official', 'assets')
Rails.application.config.assets.paths << Rails.root.join(BOWER_ASSET_PATH)

## Precompile additional assets.
## application.js, application.scss, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += [/.*\.js/, /.*\.css/, /.*\.eot/, /.*\.svg/, /.*\.ttf/, /.*\.woff/, /.*\.woff2/]
Rails.application.config.assets.precompile << %r(bootstrap-sass/assets/fonts/bootstrap/[\w-]+\.(?:eot|svg|ttf|woff2?)$)
# Minimum Sass number precision required by bootstrap-sass
::Sass::Script::Value::Number.precision = [8, ::Sass::Script::Value::Number.precision].max