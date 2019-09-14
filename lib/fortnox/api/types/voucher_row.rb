# frozen_string_literal: true

require 'fortnox/api/types/document_row'

module Fortnox
  module API
    module Types
     class VoucherRow < Fortnox::API::Types::Model
        STUB = {}.freeze

        attribute :debit,                   Types::Nullable::Float
        attribute :credit,                  Types::Nullable::Float

        attribute :account,                 Types::AccountNumber

        attribute :cost_center,             Types::Nullable::String
        attribute :project,                 Types::Nullable::String
        attribute :description,             Types::Nullable::String

        attribute :transaction_information, Types::Sized::String[100]
      end
    end
  end
end
