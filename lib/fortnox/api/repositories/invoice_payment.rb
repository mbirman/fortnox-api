# frozen_string_literal: true

require 'fortnox/api/repositories/base'
require 'fortnox/api/models/invoice_payment'
require 'fortnox/api/mappers/invoice_payment'

module Fortnox
  module API
    module Repository
      class InvoicePayment < Base
        MODEL = Model::InvoicePayment
        MAPPER = Mapper::InvoicePayment
        URI = '/invoicepayments/'

        def bookkeep(entity)
          response_hash = put(get_action_url_for(entity, :bookkeep))
          instantiate(@mapper.wrapped_json_hash_to_entity_hash(response_hash))
        end
      end
    end
  end
end
