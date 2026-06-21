class CreateParticipations < ActiveRecord::Migration[7.1]
  def change
    create_table :participations do |t|
      t.references :user, null: false, foreign_key: true
      t.date :enrollment_date
      t.string :status
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
