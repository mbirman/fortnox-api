# frozen_string_literal: true

require 'fortnox/api/repositories/base'
require 'fortnox/api/models/invoice'
require 'fortnox/api/mappers/invoice'

module Fortnox
  module API
    module Repository
      class Invoice < Base
        MODEL = Model::Invoice
        MAPPER = Mapper::Invoice
        URI = '/invoices/'

        def bookkeep(entity)
          response_hash = put(get_action_url_for(entity, :bookkeep))
          instantiate(@mapper.wrapped_json_hash_to_entity_hash(response_hash))
        end

        def email(entity)
          response_hash = get(get_action_url_for(entity, :email))
          instantiate(@mapper.wrapped_json_hash_to_entity_hash(response_hash))
        end

        def print(entity)
          response_hash = get(get_action_url_for(entity, :print))
          instantiate(@mapper.wrapped_json_hash_to_entity_hash(response_hash))
        end

        def externalprint(entity)
          response_hash = put(get_action_url_for(entity, :externalprint))
          instantiate(@mapper.wrapped_json_hash_to_entity_hash(response_hash))
        end

        def nox_finance(entity, delivery_method)
          response_hash = post("/noxfinansinvoices/", body: {
            "NoxFinansInvoice" => {
              "InvoiceNumber" => "#{entity.document_number}",
              "SendMethod" => delivery_method.upcase,
              "Service" => "LEDGERBASE"
            }
          }.to_json)

          instantiate(@mapper.wrapped_json_hash_to_entity_hash(response_hash))
        end

        def credit(entity)
          response_hash = put(get_action_url_for(entity, :credit))
          instantiate(@mapper.wrapped_json_hash_to_entity_hash(response_hash))
        end
      end
    end
  end
end
