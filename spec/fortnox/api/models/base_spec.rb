# frozen_string_literal: true

require 'spec_helper'
require 'fortnox/api/models/base'
require 'fortnox/api/types'

describe Fortnox::API::Model::Base do
  using_test_classes do
    class Entity < Fortnox::API::Model::Base
      UNIQUE_ID = :number

      attribute :private, Fortnox::API::Types::String.is(:read_only)
      attribute :string, Fortnox::API::Types::Required::String
      attribute :number, Fortnox::API::Types::Nullable::Integer
      attribute :account, Fortnox::API::Types::AccountNumber
    end
  end

  describe '.new' do
    context 'with basic attribute' do
      subject { Entity.new(string: 'Test') }

      it { is_expected.to be_a Entity }
      it { is_expected.to be_new }
      it { is_expected.not_to be_saved }
    end

    context 'without required attribute' do
      subject { -> { Entity.new({}) } }

      it { is_expected.to raise_error Fortnox::API::Exception }
      it { is_expected.to raise_error Fortnox::API::MissingAttributeError }
      it { is_expected.to raise_error Fortnox::API::MissingAttributeError, /Missing attribute :string/ }
    end

    context 'with invalid attribute value' do
      subject { -> { Entity.new(string: 'Test', account: 13_337) } }

      it { is_expected.to raise_error Fortnox::API::Exception }
      it { is_expected.to raise_error Fortnox::API::AttributeError }
      it { is_expected.to raise_error Fortnox::API::AttributeError, /invalid type for :account/ }
    end
  end

  describe '.update' do
    let(:original) { Entity.new(string: 'Test') }

    context 'with new, simple value' do
      subject { updated_model }

      let(:updated_model) { original.update(string: 'Variant') }

      it { is_expected.to be_new }
      it { is_expected.not_to be_saved }

      it 'returns a new object' do
        is_expected.not_to eql(original)
      end

      describe 'updated attribute' do
        subject { updated_model.string }

        it { is_expected.to eql('Variant') }
      end

      describe 'returned class' do
        subject { updated_model.class }

        it { is_expected.to eql(original.class) }
      end
    end

    context 'with the same, simple value' do
      subject(:updated_model) { original.update(string: 'Test') }

      it 'returns the same object' do
        is_expected.to eql(original)
      end

      it 'returns a object with the same value' do
        expect(updated_model.string).to eql('Test')
      end

      it { is_expected.to be_new }
      it { is_expected.not_to be_saved }
    end

    context 'when updating' do
      let(:updated_entity) do
        saved_entity = Entity.new(string: 'Saved', new: false, unsaved: false)
        saved_entity.update(string: 'Updated')
      end

      describe 'updated entity' do
        subject { updated_entity }

        it { is_expected.not_to be_saved }
        it { is_expected.not_to be_new }
      end

      describe 'updated attribute value' do
        subject { updated_entity.string }

        it { is_expected.to eq('Updated') }
      end
    end
  end
end
