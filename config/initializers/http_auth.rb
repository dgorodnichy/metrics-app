if Rails.env.production?
  class HttpAuthForRoute
    def initialize(app)
      @app = app
    end

    def call(env)
      req = Rack::Request.new(env)

      if req.path.start_with?("/logs")
        auth = Rack::Auth::Basic::Request.new(env)

        unless auth.provided? && auth.basic? && auth.credentials == [ "admin", "qwerty" ]
          headers = { "WWW-Authenticate" => 'Basic realm="Restricted Area"' }
          return [ 401, headers, [ "Not authorized\n" ] ]
        end
      end

      @app.call(env)
    end
  end

  Rails.application.config.middleware.insert_before(0, HttpAuthForRoute)
end
