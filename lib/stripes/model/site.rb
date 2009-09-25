require File.join(File.dirname(__FILE__), "/generated_model/App" )

module App
  class Site

    def page_count
      page_count = 0
      App.transaction do
        page_count = self.page.size   
        self.directory.each do |dir|
          page_count = page_count + dir.page_count
        end
      end
      page_count
    end

    def Site.create_new_site(params,member)

      puts "#{__FILE__}:#{__LINE__} #{__method__} PARAMS: #{params.inspect}"

      App.transaction do
        site = App.root.new_site(params[:domain])
        site.name = params[:name]
        site.title = params[:title]
        site.status = "Unpublished"

        flag = true

        if 0 == member.access.size then
          access = member.new_access("admin")
          access << site
          flag = false
        end

        member.access.each do |access|
          access << site if "admin" === access.id && flag
        end
      end
    end

  end
end
