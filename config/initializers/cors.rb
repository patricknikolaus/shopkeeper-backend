Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'shopkeepergg.com', 'localhost:8080', 'localhost:4200', 'optimistic-albattani-5f6091.netlify.app'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end