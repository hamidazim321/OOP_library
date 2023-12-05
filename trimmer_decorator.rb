require_relative 'decorator'
class TrimmerDecorator < Decorator
  def correct_name
    return super[0, 9] if super.length > 10

    super
  end
end
