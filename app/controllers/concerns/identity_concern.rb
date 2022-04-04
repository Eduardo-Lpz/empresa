# frozen_string_literal: true

module IdentityConcern
  extend ActiveSupport::Concern

  included do
    http_basic_authenticate_with name: "bdd", password: "2022"
  end
end
