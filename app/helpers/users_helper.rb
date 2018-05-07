module UsersHelper

  def calculate_avarage(kills, games)
    if kills.nil? || games.nil?
      ''
    else
      result = kills.to_f / games.to_f
      helper.number_with_precision(result, precision: 2)
    end
  end

  private

  def helper
    @helper ||= Class.new do
      include ActionView::Helpers::NumberHelper
    end.new
  end
end
