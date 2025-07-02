# frozen_string_literal: true

class AbstractViewContext

  def self.view_context
    lookup_context = ActionView::LookupContext.new(ActionController::Base.view_paths)
    assigns        = {}
    controller     = AbstractApplicationController.new

    ActionView::Base.new(lookup_context, assigns, controller)
  end

end
