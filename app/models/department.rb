# frozen_string_literal: true

# class creates department model
class Department < ActiveRecord::Base
  has_many :majors
  has_many :students, through: :majors
  has_many :petitions, through: :students
end