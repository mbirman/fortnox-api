# frozen_string_literal: true

module Matchers
  module Type
    def have_currency(attribute, valid_hash = {})
      EnumMatcher.new(attribute, valid_hash, 'CurrencyCode', 'Currencies')
    end
  end
end
