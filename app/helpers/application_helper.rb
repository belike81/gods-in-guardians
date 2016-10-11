module ApplicationHelper
  def calculate_kd(kills, deaths)
    kd = (deaths > 0) ? kills.to_f/deaths.to_f : kills.to_f
    number_to_human kd, precision: 3
  end
end
