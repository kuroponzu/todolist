module ApplicationHelper
    def qiita_markdown(markdown)
      processor = Qiita::Markdown::Processor.new(hostname: "example.com")
      processor.call(markdown)[:output].to_s.html_safe
    end

    def show_days(time)
      return time unless time
      time.strftime("%Y/%m/%d")
    end

end
