# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'fonts')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w(FSRAIL55.ttf logo.png day_off.png jquery.datepick.css  ddslick.js bootstrap.css bootsrap.js glyphicons-halflings-regular.woff2 glyphicons-halflings-regular.woff glyphicons-halflings-regular.ttf   )

Time::DATE_FORMATS[:default] = '%d.%m.%Y %H:%M'
Date::DATE_FORMATS[:default] = '%d.%m.%Y'