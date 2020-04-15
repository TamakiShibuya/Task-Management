module TasksHelper
  def diffDate(deadline)
    today = Date.current
    diff = (deadline - today).to_i
    "あと#{diff}日"
  end

  def today
    today = Date.today
  end
end