SUCCESS_CODE = 200
BAD_REQUEST_CODE = 400
PAGE_NOT_FOUND_CODE = 404

ACCESS_METHODS = ['/time'].freeze

require_relative 'middleware/common_error_processing'
require_relative 'time'
require_relative 'app'

use CommonErrorProcessing

run App.new
