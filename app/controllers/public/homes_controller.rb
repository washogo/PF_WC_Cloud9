class Public::HomesController < ApplicationController
  def top
    @lessons=Lesson.all
  end
end
