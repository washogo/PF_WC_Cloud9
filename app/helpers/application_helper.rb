module ApplicationHelper
  def total_price(cart_lessons)
    total_price=0
    cart_lessons.each do |cart_lesson|
      total_price += cart_lesson.lesson.price * 1.1
    end
    "#{total_price.to_i}"
  end

  def tax_price(lesson)
    tax_price=lesson.price * 1.1
    "#{tax_price.to_i}"
  end

  def contract_period(period)
    if period==0
      "単発"
    else
      "#{period}ヶ月"
    end
  end

  def is_in_lecture(state)
    if state
      "開講中"
    else
      "閉講中"
    end
  end

  def update_at_date(updated_at, multiple)
    updated_at + 24*60*60 * multiple*30
  end

end
