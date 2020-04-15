class Contact < ApplicationRecord
    belongs_to :kind, optional: true

    def author
        "Doug"
    end

    def kind_description
        self.kind != nil ? self.kind.description : ""
    end

    def as_json(options={})
        super(
            root: true,
            include: { kind: { only: :description } },
            methods: [:kind_description, :author]
            )
    end
end
