# frozen_string_literal: true

require 'fortnox/api/repositories/base'
require 'fortnox/api/models/voucher'
require 'fortnox/api/mappers/voucher'

module Fortnox
  module API
    module Repository
      class Voucher < Base
        MODEL = Model::Voucher
        MAPPER = Mapper::Voucher
        URI = '/vouchers/'
      end
    end
  end
end
