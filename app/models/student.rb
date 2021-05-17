# frozen_string_literal: true

# class creates student model
class Student < ActiveRecord::Base
  belongs_to :advisor
  has_many :majors, through: :petitions
  has_many :petitions
end