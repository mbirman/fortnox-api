# frozen_string_literal: true

require 'fortnox/api/types'
require 'fortnox/api/models/base'

module Fortnox
  module API
    module Model
      class Currency < Fortnox::API::Model::Base
        UNIQUE_ID = :code
        STUB = { description: '' }.freeze

        attribute :url,         Types::Nullable::String
        attribute :code,        Types::Nullable::String
        attribute :description, Types::Nullable::String

        attribute :buy_rate,  Types::Nullable::Float
        attribute :sell_rate, Types::Nullable::Float

        attribute :unit, Types::Nullable::Float
        attribute :date, Types::Nullable::Date

        attribute :is_automatic, Types::Nullable::Boolean
      end
    end
  end
end
