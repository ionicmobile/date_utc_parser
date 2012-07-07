require "date_utc_parser/version"
require 'time'

module DateUtcParser
  def self.parse(date)
    date.is_a?(Time) ? parse_from_time(date) : parse_from_string(date)
  end

  def self.parse_from_string(date)
    Time.parse(date) if date && date =~ iso8601_pattern
  rescue ArgumentError
    # date could not be parsed
  end

  # http://www.w3.org/TR/NOTE-datetime
  # http://tools.ietf.org/html/rfc3339
  # 
  # example: 1994-11-05T13:15:30Z
  #
  def self.iso8601_pattern
    /\A\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z\Z/
  end

  def self.iso8601_humanized_pattern
    "YYYY-MM-DDTmm:dd:ssZ"
  end

  def self.parse_from_time(date)
    date.utc? ? date : date.utc
  end
end

