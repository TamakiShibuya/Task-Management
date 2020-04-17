module TasksHelper
  def diffDate(deadline)
    today = Date.current
    diff = (deadline - today).to_i
    "あと#{diff}日"
  end

  def today
    today = Time.zone.today
  end
end