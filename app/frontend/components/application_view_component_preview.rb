class ApplicationViewComponentPreview < KitsuneDS::ViewComponentPreview

  private

    def kds_component
      self.class.component_class_name.constantize
    end

    def kds_component_properties
      kds_component.properties
    end

end
