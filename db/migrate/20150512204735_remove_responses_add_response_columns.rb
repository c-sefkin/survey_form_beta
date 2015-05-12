class RemoveResponsesAddResponseColumns < ActiveRecord::Migration
  def change
    add_column(:questions, :response_1, :string)
    add_column(:questions, :response_2, :string)
    add_column(:questions, :response_3, :string)
    add_column(:questions, :response_4, :string)
  end
end
