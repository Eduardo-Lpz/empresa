# frozen_string_literal: true

class Employee < ApplicationRecord
  validates :salary, numericality: { greater_than_or_equal_to: 0 }
end
