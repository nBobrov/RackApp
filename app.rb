class App

  def call(env)
    request = Rack::Request.new(env)

    result = GetTime.new(request.params['format']).call

    if result.success?
      http_code = SUCCESS_CODE
      body = result.time_sting
    else
      http_code = BAD_REQUEST_CODE
      body = "Unknown time format [#{result.invalid_string}]"
    end

    response(http_code, ["#{body}\n"])
  end

  private

  def response(http_code, body)
    response = Rack::Response.new(body, http_code,  { 'Content-Type' => 'text/plain' })
    response.finish
  end

end