class CommonErrorProcessing

  def initialize(app)
    @app = app
  end

  def call(env)
    if method_found?(env['REQUEST_PATH'])
      @app.call(env)
    else
      page_not_found(env['REQUEST_PATH'])
    end
  end

  private

  def method_found?(path)
    ACCESS_METHODS.include?(path)
  end

  def page_not_found(path)
    [PAGE_NOT_FOUND_CODE, { 'Content-Type' => 'text/plain' }, ["Page #{path} not found!\n"]]
  end
end