module Public::LessonsHelper

  def evaluation_average(evaluations)
    sum=0
    count=0

    evaluations.each do |evaluation|
      sum += evaluation.evaluation.to_i
      count=Evaluation.where(lesson_id: evaluation.lesson_id).count
    end

    average = sum / count

    case average.floor
    when 1
      "⭐️"
    when 2
      "⭐️⭐"
    when 3
      "⭐️⭐⭐️"
    when 4
      "⭐️⭐⭐️⭐"
    when 5
      "⭐️⭐⭐️⭐⭐️"
    end

  end

end
