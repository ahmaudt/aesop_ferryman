# frozen_string_literal: true

# creates table for integer-based term codes
class CreateAcademicTermCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :academic_term_codes do |t|
      t.integer :term_code
    end
  end
end
