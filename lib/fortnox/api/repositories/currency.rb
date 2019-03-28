# frozen_string_literal: true

require 'fortnox/api/repositories/base'
require 'fortnox/api/models/currency'
require 'fortnox/api/mappers/currency'

module Fortnox
  module API
    module Repository
      class Currency < Base
        MODEL = Model::Currency
        MAPPER = Mapper::Currency
        URI = '/currencies/'
      end
    end
  end
end
