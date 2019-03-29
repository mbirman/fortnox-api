module Fortnox
  module API
    module Repository
      module Actions
        def get_action_url_for(entity, action)
          "#{self.class::URI}#{entity.unique_id}/#{action}"
        end
      end
    end
  end
end
