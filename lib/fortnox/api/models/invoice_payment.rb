# frozen_string_literal: true

require 'fortnox/api/types'
require 'fortnox/api/models/base'

module Fortnox
  module API
    module Model
      class InvoicePayment < Document
        UNIQUE_ID = :number
        STUB = { invoice_number: '' }.freeze

        # Amount Amount of the payment
        attribute :amount, Types::Nullable::Float

        # AmountCurrency Amount in the specified currency of the payment. Required if Currency is other than SEK
        attribute :amount_currency, Types::Nullable::Float

        # Booked If the payment is booked or not
        attribute :booked, Types::Nullable::Boolean.is(:read_only)

        # InvoiceCustomerName Customer name of the invoice
        attribute :invoice_customer_name, Types::Nullable::String.is(:read_only)

        # InvoiceCustomerNumber Customer number of the invoice
        attribute :customer_number, Types::Nullable::String.is(:read_only)

        # InvoiceNumber Invoice number
        attribute :invoice_number, Types::Nullable::Integer

        # InvoiceDueDate Due date of the invoice
        attribute :invoice_due_date, Types::Nullable::Date.is(:read_only)

        # InvoiceOCR OCR of the invoice
        attribute :invoice_ocr, Types::Nullable::String.is(:read_only)

        # InvoiceTotal Invoice total
        attribute :invoice_total, Types::Nullable::Float.is(:read_only)

        # ModeOfPayment Code of the mode of payment
        attribute :mode_of_payment, Types::Nullable::String

        # ModeOfPaymentAccount Account for the mode of payment
        attribute :mode_of_payment_account, Types::Nullable::Integer

        # Number Payment number
        attribute :number, Types::Nullable::Integer.is(:read_only)

        # PaymentDate Date of the payment
        attribute :payment_date, Types::Nullable::Date

        # VoucherNumber Number of the voucher
        attribute :voucher_number, Types::Nullable::Integer.is(:read_only)

        # VoucherSeries Series of the voucher
        attribute :voucher_series, Types::Nullable::String.is(:read_only)

        # VoucherYear Id of the voucher year
        attribute :voucher_year, Types::Nullable::Integer.is(:read_only)

        # Source Payment source (manual / direct)
        attribute :source, Types::Nullable::String.is(:read_only)

        # WriteOffs
        attribute :write_offs, Types::Strict::Array.of(Types::WriteOff)
      end
    end
  end
end
