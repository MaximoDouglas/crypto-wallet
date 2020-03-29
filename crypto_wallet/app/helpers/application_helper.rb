module ApplicationHelper
    def application_name
        "CRYPTO WALLET"
    end

    def date_br(date_us)
        date_us.strftime("%d/%m/%Y")
    end
end
