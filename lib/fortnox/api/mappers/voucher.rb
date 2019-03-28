# frozen_string_literal: true

require 'fortnox/api/mappers/base'

module Fortnox
  module API
    module Mapper
      class Voucher < Fortnox::API::Mapper::Base
        KEY_MAP = {}.freeze
        JSON_ENTITY_WRAPPER = 'Voucher'
        JSON_COLLECTION_WRAPPER = 'Vouchers'
      end

      Registry.register(Voucher.canonical_name_sym, Voucher)
    end
  end
end
