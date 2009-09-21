require File.join(File.dirname(__FILE__), "/generated_model/App" )

module App
  class Site

    def Site.create_new_site(params,member)
      App.transaction do
        site = App.root.new_site(params[:domain])
        site.name = params[:name]
        site.title = params[:title]

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
