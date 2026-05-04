class Button::Component < ApplicationViewComponent

  html_options {
    attributes { {
      data: {
        component: :button
      }
    } }
    css_variants {
      base { %w[
        inline-flex
        h-10
        items-center
        justify-center
        rounded-md
        px-3.5
        text-sm
        font-medium
        uppercase
        text-white
        focus-visible:outline-2
        focus-visible:outline-offset-2
      ] }
      variants {
        color {
          primary { %w[
            bg-blue-600
            hover:bg-brand-bold-hover
            focus-visible:bg-brand-bold-active
          ] }
          secondary { %w[
            text-brand
            ring-2
            ring-inset
            ring-brand-bold
            hover:bg-brand-bold-hover
            hover:text-white
            hover:ring-0
            focus-visible:bg-brand-bold-active
            focus-visible:text-white
            focus-visible:ring-0
          ] }
          alert   { %w[
            bg-alert-bold
            hover:bg-alert-bold-hover
            focus-visible:bg-alert-bold-active
          ] }
        }
        width {
          auto { %w[w-fit] }
          full { %w[w-full] }
        }
      }
    }
  }

  # ==== Properties

  property :label,
    type:     :string,
    required: true

  property :color,
    enum:    css_variants_for(:color),
    default: :primary

  property :url,
    type:     :string,
    optional: true

  property :width,
    enum:     css_variants_for(:width),
    optional: true

  # ==== Slots

  # ==== Delegators

  # ==== Instance

  def call
    # tag.div(label, **root_html_options(color: color, width: width))
  end

end
