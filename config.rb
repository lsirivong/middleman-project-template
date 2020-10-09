# Activate and configure extensions
  # https://middlemanapp.com/advanced/configuration/#configuring-extensions

  # We need allow all origins in order for ads to work locally
  use ::Rack::Cors do
    allow do
      origins '*'
      resource '*', headers: :any, methods: [:get, :options]
    end
  end

  activate :autoprefixer do |prefix|
    prefix.browsers = "last 2 versions"
  end

  # Layouts
  # https://middlemanapp.com/basics/layouts/

  # Per-page layout changes
  page '/*.xml', layout: false
  page '/*.json', layout: false
  page '/*.txt', layout: false

  # Build-specific configuration
  # https://middlemanapp.com/advanced/configuration/#environment-specific-settings

  configure :build do
    # activate :minify_css
    # activate :minify_javascript
    if ENV['CSK_ASSET_HOST']
      activate :asset_host, host: ENV['CSK_ASSET_HOST']
    else
      activate :relative_assets
    end
  end