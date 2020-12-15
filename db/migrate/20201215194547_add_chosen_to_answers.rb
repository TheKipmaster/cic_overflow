class AddChosenToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :chosen, :bool
  end
end
