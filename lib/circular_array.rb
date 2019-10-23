# frozen_string_literal: true

class CircularArray < Array
  VERSION = '0.2.0'

  def [](index)
    return nil if empty?

    super(index % size)
  end
end
