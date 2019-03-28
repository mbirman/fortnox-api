# frozen_string_literal: true

require 'fortnox/api/types/document_row'

module Fortnox
  module API
    module Types
      class WriteOff < DocumentRow
        STUB = {}.freeze

        attribute :amount, Types::Nullable::Float

        attribute :account_number, Types::Nullable::Integer

        attribute :project,                 Types::Nullable::String
        attribute :currency,                Types::Nullable::String
        attribute :cost_center,             Types::Nullable::String
        attribute :description,             Types::Nullable::String
        attribute :transaction_information, Types::Nullable::String
      end
    end
  end
end
