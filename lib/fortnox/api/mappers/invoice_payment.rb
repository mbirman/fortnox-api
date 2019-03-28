# frozen_string_literal: true

require 'fortnox/api/mappers/base'

module Fortnox
  module API
    module Mapper
      class InvoicePayment < Fortnox::API::Mapper::Base
        KEY_MAP = { invoice_ocr: 'InvoiceOCR' }.freeze
        JSON_ENTITY_WRAPPER = 'InvoicePayment'
        JSON_COLLECTION_WRAPPER = 'InvoicePayments'
      end

      Registry.register(InvoicePayment.canonical_name_sym, InvoicePayment)
    end
  end
end
