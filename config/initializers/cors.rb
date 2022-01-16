Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'shopkeepergg.netlify.app', 'localhost:8080', 'localhost:4200', 'https://shopkeepergg.com'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end