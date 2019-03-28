# frozen_string_literal: true

require 'fortnox/api/mappers/base'

module Fortnox
  module API
    module Mapper
      class Currency < Fortnox::API::Mapper::Base
        KEY_MAP = {
        }.freeze
        JSON_ENTITY_WRAPPER = 'Currency'
        JSON_COLLECTION_WRAPPER = 'Currencies'
      end

      Registry.register(Currency.canonical_name_sym, Currency)
    end
  end
end
