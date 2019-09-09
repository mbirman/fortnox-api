# frozen_string_literal: true

module Fortnox
  module API
    module RequestHandling
      private

        def raise_api_error(error, response)
          message = (error['message'] || error['Message'] || 'Okänt fel')

          message += "\n\n#{response.request.inspect}" if Fortnox::API.debugging

          raise Fortnox::API::RemoteServerError, message
        end

        def validate_response(response)
          case response.code
          when 200
          when 423
            # HACK: FN doesn't actually provide JSON response in that case
            #   they just render HTML error page.
            raise_api_error({"message" => "Too Many Requests"}, response)
          else
            api_error = response.parsed_response['ErrorInformation']
            raise_api_error(api_error, response) if api_error
          end
        end

        def validate_and_parse(response)
          validate_response(response)
          response.parsed_response
        end

        def execute
          response = yield(self.class)
          validate_and_parse response
        end
    end
  end
end
