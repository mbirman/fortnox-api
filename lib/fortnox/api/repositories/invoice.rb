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
          put(get_action_url_for(entity, :bookkeep))
        end

        def email(entity)
          get(get_action_url_for(entity, :email))
        end

        def print(entity)
          get(get_action_url_for(entity, :print))
        end

        def externalprint(entity)
          put(get_action_url_for(entity, :externalprint))
        end

        def nox_finance(entity, delivery_method)
          post("/noxfinansinvoices/", body: {
            "NoxFinansInvoice" => {
              "InvoiceNumber" => "#{entity.document_number}",
              "SendMethod" => delivery_method.upcase,
              "Service" => "LEDGERBASE"
            }
          }.to_json)
        end
      end
    end
  end
end
