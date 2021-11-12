class GetTime

  TIME_FORMATS = {
    'year' => { format: '%Y', separate: '-' },
    'month' => { format: '%m', separate: '-' },
    'day' => { format: '%d', separate: ' ' },
    'hour' => { format: '%H', separate: ':' },
    'minute' => { format: '%M', separate: ':' },
    'second' => { format: '%S', separate: ':' }
  }.freeze

  Result = Struct.new(:time_sting, :invalid_string, :success?)

  def initialize(formats_string)
    @formats = formats_string.split(',')
    @invalid_string = get_unknown_format
  end

  def call
    time = get_time if success?
    Result.new(time, @invalid_string, success?)
  end

  def success?
    @invalid_string.empty?
  end

  private

  def get_unknown_format
    @formats.reject do |format|
      TIME_FORMATS.keys.include?(format)
    end.join(', ')
  end

  def get_time
    time_format = @formats.reduce('') do |val, param|
      "#{val}#{TIME_FORMATS[param][:format]}#{TIME_FORMATS[param][:separate]}"
    end

    Time.now.strftime(time_format.chop)
  end

end