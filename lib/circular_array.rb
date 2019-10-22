# frozen_string_literal: true

class CircularArray < Array
  VERSION = '0.1.0'

  def [](index)
    return nil if empty?

    super(index % size)
  end
end
