class Post < ApplicationRecord
    after_initialize :set_ivars

    # Validations
    validates :title, :presence => true, :length => { :minimum => 5 }, if: lambda{ |model| model.instance_variable_get(:@strict_priority_validation) }
    validates :subtitle, :presence => true, :length => { :minimum => 10 }, if: lambda{ |model| model.instance_variable_get(:@strict_priority_validation) }
    validates :description, :presence => true, :length => { :minimum => 5, :maximum => 150 }, if: lambda{ |model| model.instance_variable_get(:@strict_priority_validation) }

    private
        def set_ivars
            @strict_priority_validation = true
        end
end
