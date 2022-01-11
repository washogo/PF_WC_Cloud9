module Public::HaveLessonsHelper

  def update_at_date(updated_at, multiple)
    updated_at + 24*60*60 * multiple*30
  end

end
