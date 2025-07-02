# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base

  primary_abstract_class

  def one
  end

  private

    def derp
      {
        one:  1,
        five: 5
      }
    end

end
