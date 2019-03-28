# frozen_string_literal: true

require 'fortnox/api/mappers/base'

module Fortnox
  module API
    module Mapper
      class VoucherRow < Fortnox::API::Mapper::Base
        KEY_MAP = {}.freeze
        JSON_ENTITY_WRAPPER = 'VoucherRow'
        JSON_COLLECTION_WRAPPER = 'VoucherRows'
      end

      Registry.register(VoucherRow.canonical_name_sym, VoucherRow)
      Registry.register(:voucherrows, VoucherRow)
    end
  end
end
