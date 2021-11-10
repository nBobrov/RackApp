class App

  def call(env)
    request = Rack::Request.new(env)
    time = GetTime.new(request.params['format'])

    if time.valid_format?
      [SUCCESS_CODE, headers, ["#{time.now}\n"]]
    else
      bad_request(time.unknown_format)
    end
  end

  private

  def headers
    { 'Content-Type' => 'text/plain' }
  end

  def bad_request(unknown_format)
    [BAD_REQUEST_CODE, headers, ["Unknown time format [#{unknown_format.join(', ')}]\n"]]
  end
end