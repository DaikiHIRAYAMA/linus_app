module ApplicationHelper
    def current_user?(user)
        user == current_user
    end

    def current_company?(company)
        company == current_company
    end

end
