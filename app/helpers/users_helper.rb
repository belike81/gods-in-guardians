module UsersHelper

  def calculate_avarage(kills, games)
    if kills.nil? || games.nil?
      ''
    else
      result = kills / games
      helper.number_to_human(result, precision: 3)
    end
  end

  private

  def helper
    @helper ||= Class.new do
      include ActionView::Helpers::NumberHelper
    end.new
  end
end
