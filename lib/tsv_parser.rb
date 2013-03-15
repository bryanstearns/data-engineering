class TsvParser
  # Parses tab-separated-value file content (with a header row assumed)
  # into objects with attributes matching the header fields, e.g.:
  #
  #   first name\tlast name
  #   Bob\tSmith
  #
  #   > row.first_name #=> "Bob"
  #   > row.last_name #=> "Smith"

  include Enumerable

  def initialize(text)
    @text = text
    @lines = line_enumerator
    @row_struct = define_row_struct
  end

  def each
    loop { yield self.next }
  end

  def next
    @row_struct.new(*values(next_raw_line))
  end

  def next_raw_line
    @lines.next
  end

  def line_enumerator
    @text.each_line
  end

  def define_row_struct
    Struct.new(*attributes)
  end

  def attributes
    @attributes ||= values(next_raw_line).map {|name| name.gsub(' ', '_').to_sym }
  end

  def values(line)
    line.strip.split("\t")
  end
end
