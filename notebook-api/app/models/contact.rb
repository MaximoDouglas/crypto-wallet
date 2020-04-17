class Contact < ApplicationRecord
    belongs_to :kind, optional: true
    
    has_many   :phones
    accepts_nested_attributes_for :phones, allow_destroy: true
    
    has_one    :address
    accepts_nested_attributes_for :address

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
                phones: {},
                address: { except: [:created_at, :updated_at] }
            },
            methods: [
                :kind_description, 
                :author
            ])
    end
end
