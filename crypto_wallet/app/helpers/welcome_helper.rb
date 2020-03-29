module WelcomeHelper
    def name_on_title
        if @name != nil
          ", " + @name
        end
    end    
end
