class AddTakersTable < ActiveRecord::Migration
  def change
    create_table(:takers) do |t|
      t.column(:name, :string)
      t.column(:survey_id, :integer)
    end
  end
end
