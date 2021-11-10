class GetTime

  TIME_FORMATS = {
    'year' => { format: '%Y', separate: '-' },
    'month' => { format: '%m', separate: '-' },
    'day' => { format: '%d', separate: ' ' },
    'hour' => { format: '%H', separate: ':' },
    'minute' => { format: '%M', separate: ':' },
    'second' => { format: '%S', separate: ':' }
  }.freeze

  def initialize(formats_string)
    @formats = formats_string.split(',')
  end

  def valid_format?
    unknown_format.count.zero?
  end

  def unknown_format
    @formats.reject do |format|
      TIME_FORMATS.keys.include?(format)
    end
  end

  def now
    time_format = @formats.reduce('') do |val, param|
      "#{val}#{TIME_FORMATS[param][:format]}#{TIME_FORMATS[param][:separate]}"
    end

    Time.now.strftime(time_format.chop)
  end

end