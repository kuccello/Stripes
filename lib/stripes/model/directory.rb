require File.join(File.dirname(__FILE__), "/generated_model/App" )

module App
  class Directory

    def page_count()
      page_count = 0
      App.transaction do
        page_count = dir.page.size
        dir.directory.each do |dir|
          page_count = page_count + dir.private_page_count(dir)
        end
      end
      page_count
    end
  end
end
