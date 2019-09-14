# frozen_string_literal: true

require 'fortnox/api/types'
require 'fortnox/api/models/base'

module Fortnox
  module API
    module Model
      class Voucher < Fortnox::API::Model::Base
        UNIQUE_ID = :voucher_number
        STUB = { description: '' }.freeze

        attribute :transaction_date,  Types::Nullable::Date

        attribute :comments,          Types::Nullable::String
        attribute :description,       Types::Nullable::String
        attribute :reference_number,  Types::Nullable::String.is(:read_only)
        attribute :reference_type,    Types::Nullable::String.is(:read_only)
        attribute :voucher_series,    Types::Nullable::String.is(:read_only)

        attribute :year,            Types::Nullable::Integer.is(:read_only)
        attribute :voucher_number,  Types::Nullable::Integer.is(:read_only)

        attribute :voucher_rows,  Types::Strict::Array.of(Types::VoucherRow)
      end
    end
  end
end
