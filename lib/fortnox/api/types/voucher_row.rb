# frozen_string_literal: true

require 'fortnox/api/types/document_row'

module Fortnox
  module API
    module Types
     class VoucherRow < DocumentRow
        STUB = {}.freeze

        attribute :debit,                   Types::Nullable::Float
        attribute :credit,                  Types::Nullable::Float

        attribute :account,                 Types::AccountNumber

        attribute :description,             Types::Nullable::String

        attribute :transaction_information, Types::Sized::String[100]
      end
    end
  end
end
