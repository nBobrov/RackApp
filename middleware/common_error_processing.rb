class CommonErrorProcessing

  def initialize(app)
    @app = app
  end

  def call(env)
    if method_found?(env['REQUEST_PATH'])
      @app.call(env)
    else
      response = Rack::Response.new(["Page #{env['REQUEST_PATH']} not found!\n"], PAGE_NOT_FOUND_CODE,  { 'Content-Type' => 'text/plain' })
      response.finish
    end
  end

  private

  def method_found?(path)
    ACCESS_METHODS.include?(path)
  end
end