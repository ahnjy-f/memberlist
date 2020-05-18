module ApplicationHelper
    def document_title
        if @title.present?
            "#{@title} - 社員名簿サービス"
        else
            '社員名簿サービス'
        end
    end
end

