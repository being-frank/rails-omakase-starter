class ApplicationRecord < ActiveRecord::Base

  primary_abstract_class

  self.implicit_order_column = :created_at

  class << self

    include ActionView::Helpers::TextHelper

    def human_name(plural: true)
      if plural
        model_name.human.pluralize
      else
        model_name.human
      end
    end

  end

  def dom_id
    ActionView::RecordIdentifier.dom_id(self)
  end

end
