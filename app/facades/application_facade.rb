class ApplicationFacade

  include RoutableConcern

  # ==== Class Methods

  class << self

    attr_reader \
      :model_class

  end

  # ==== Delegators

  delegate \
    :model_class,
    to: :class

  delegate \
    :params,
    to: :controller

  delegate \
    :concat,
    :l,
    :localize,
    :stim,
    :stims,
    :t,
    :tag,
    :translate,
    to: :helpers

  # ==== Instance

  def title(plural=true)
    model_class.human_name(plural: plural)
  end

  def view_context
    @view_context ||= AbstractViewContext.view_context
  end

  def controller
    @controller ||= view_context.controller
  end

  def helpers
    @helpers ||= ApplicationController.helpers
  end

  def request
    @request ||= controller.request
  end

  private

    def table_thead(collection, klass)
      collection = collection.presence || [ {} ]
      collection.first.each_with_object([]) do |(column, item), array|
        array.push(item.except(:class).merge(
          with_content: klass.human_attribute_name(column)
        ))
      end
    end

    def table_tbody(collection)
      collection.each_with_object([]) do |item, array|
        array.push(item.values.except(:thead))
      end
    end

end
