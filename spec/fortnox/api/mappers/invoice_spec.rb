# frozen_string_literal: true

require 'spec_helper'
require 'fortnox/api'
require 'fortnox/api/mappers/invoice'
require 'fortnox/api/mappers/examples/mapper'

describe Fortnox::API::Mapper::Invoice do
  key_map =
    {
      administration_fee_vat: 'AdministrationFeeVAT',
      edi_information: 'EDIInformation',
      eu_quarterly_report: 'EUQuarterlyReport',
      freight_vat: 'FreightVAT',
      housework: 'HouseWork',
      ocr: 'OCR',
      total_vat: 'TotalVAT',
      vat_included: 'VATIncluded'
    }

  json_entity_type = 'Invoice'
  json_entity_collection = 'Invoices'

  it_behaves_like 'mapper', key_map, json_entity_type, json_entity_collection do
    let(:mapper) { described_class.new }
  end
end
