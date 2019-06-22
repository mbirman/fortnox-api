# frozen_string_literal: true

require 'fortnox/api/mappers/base'

module Fortnox
  module API
    module Mapper
      class WriteOff < Fortnox::API::Mapper::Base
        KEY_MAP = {}.freeze
        JSON_ENTITY_WRAPPER = 'WriteOff'
        JSON_COLLECTION_WRAPPER = 'WriteOffs'
      end

      Registry.register(WriteOff.canonical_name_sym, WriteOff)
      Registry.register(:writeoffs, WriteOff)
    end
  end
end
