# frozen_string_literal: true

class CircularArray < Array
  VERSION = '0.1.0'

  def [](index)
    result = super

    return result if result
    return nil if size.zero?

    self[index - size]
  end
end
