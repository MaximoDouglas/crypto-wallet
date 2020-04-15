class Contact < ApplicationRecord
    belongs_to :kind

    def author
        "Doug"
    end

    def kind_description
        self.kind.description
    end

    def as_json(options={})
        super(
            root: true,
            include: { kind: { only: :description } },
            methods: [:kind_description, :author]
            )
    end
end
