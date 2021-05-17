# frozen_string_literal: true

# class creates petition table to persist petition model data into db
class CreatePetitions < ActiveRecord::Migration[5.2]
  def change
    create_table :petitions do |t|
      t.string :petition_type
      t.string :content
      t.integer :advisor_id
      t.integer :student_id

      t.timestamps
    end
  end
end
