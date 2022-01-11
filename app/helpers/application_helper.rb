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
end
