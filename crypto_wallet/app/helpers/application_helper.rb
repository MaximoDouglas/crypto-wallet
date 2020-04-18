module ApplicationHelper
    def application_name
        "CRYPTO WALLET"
    end

    def rails_environment
        if (Rails.env.production?)
            "produção"
        elsif (Rails.env.development?)
            "desenvolvimento"
        else
            "teste"
        end
    end

    def date_br(date_us)
        date_us.strftime("%d/%m/%Y")
    end
end
