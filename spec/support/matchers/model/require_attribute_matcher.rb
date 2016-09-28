module Matchers
  module Model
    def require_attribute(attribute, valid_hash)
      RequireAttributeMatcher.new(attribute, valid_hash)
    end

    class RequireAttributeMatcher

      def initialize(attribute, valid_hash)
        @attribute = attribute
        @invalid_hash = valid_hash.dup.tap{ |hash| hash.delete( attribute ) }
      end

      def matches?(klass)
        @klass = klass
        raise_error && includes_error_message
      end

      def failure_message
        return no_exception_failure_message unless raise_error
        return wrong_error_message unless includes_error_message
      end

      def description
        "require attribute #{@attribute.inspect}"
      end

      private

        def raise_error
          @klass.new(@invalid_hash)

          false # Fail test since expected error is not thrown

        rescue Dry::Types::StructError
          true
        end

        def includes_error_message
          @klass.new(@invalid_hash)
        rescue Dry::Types::StructError => error
          if error.message.include?(expected_error_message)
            return true
          else
            @wrong_error_message = error.message
            return false
          end
        end

        def expected_error_message
          "#{@attribute.inspect} is missing in Hash input"
        end

        def no_exception_failure_message
          "Expected class to raise #{Dry::Types::StructError} "\
          "when attribute #{@attribute.inspect} is missing."
        end

        def wrong_error_message
          "Expected exception to include \"#{expected_error_message}\". "\
          "Message was \"#{@wrong_error_message}\"."
        end
    end
  end
end
