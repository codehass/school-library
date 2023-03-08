require_relative './decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    output = @nameable.correct_name
    output.size > 10 ? output[0, 10] : output
  end
end
