class Contact < ApplicationRecord
    belongs_to :kind, optional: true
    has_many   :phones
    
    accepts_nested_attributes_for :phones, allow_destroy: true

    def author
        "Doug"
    end

    def kind_description
        self.kind != nil ? self.kind.description : ""
    end

    def as_json(options={})
        super(
            root: true,
            include: { 
                kind: { only: :description }, 
                phones: { } 
            },
            methods: [
                :kind_description, 
                :author
            ])
    end
end
