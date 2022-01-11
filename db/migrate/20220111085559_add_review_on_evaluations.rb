class AddReviewOnEvaluations < ActiveRecord::Migration[5.2]
  def change
    add_column :evaluations, :review, :text
    change_column :evaluations, :review, :text, null: false
  end
end
