module App

  require "xamplr"
	include Xampl


  XamplObject.ns_preferred_prefix("http://www.soldierofcode.com/stripes", "app")

  module StripesAsChild
    require "xamplr/indexed-array"
  
    def stripes_child
      accessed
      @stripes_child
    end

    def stripes_child=(v)
      accessed
      @stripes_child = v
    end

    alias stripes stripes_child
    alias stripes= stripes_child=
  
    def init_stripes_as_child
      @stripes_child = IndexedArray.new
    end
  
    def add_stripes(stripes)
      accessed
      index = stripes.get_the_index
      if(nil == index) then
        raise Xampl::XamplException.new("no value for the index 'pid' of stripes defined in : " << stripes.pp_xml)
      end

      existing = @stripes_child[index]

      return existing if existing == stripes

			self.remove_stripes(index) if existing

      @children << stripes
      @stripes_child[index] = stripes

      stripes.add_parent(self)

      changed
      return stripes
    end
  
    def new_stripes(index)
      accessed

      stripes = nil
      stripes = Stripes.lookup(index) if Xampl.persister and Xampl.persister.automatic
      stripes = Stripes.new(index) unless stripes

      yield(stripes) if block_given?
      return add_stripes(stripes)
    end

    def ensure_stripes(index)
      accessed

      stripes = @stripes_child[index]
		  return stripes if stripes 

      stripes = Stripes.lookup(index) if Xampl.persister and Xampl.persister.automatic
      stripes = Stripes.new(index) unless stripes

      yield(stripes) if block_given?
      return add_stripes(stripes)
		end

    def remove_stripes(index)
      accessed
			changed
	    unless String === index or Symbol === index then
        index = index.get_the_index
			end
      stripes = @stripes_child.delete(index) if index
      @children.delete(stripes)
    end
  end

  module SiteAsChild
    require "xamplr/indexed-array"
  
    def site_child
      accessed
      @site_child
    end

    def site_child=(v)
      accessed
      @site_child = v
    end

    alias site site_child
    alias site= site_child=
  
    def init_site_as_child
      @site_child = IndexedArray.new
    end
  
    def add_site(site)
      accessed
      index = site.get_the_index
      if(nil == index) then
        raise Xampl::XamplException.new("no value for the index 'pid' of site defined in : " << site.pp_xml)
      end

      existing = @site_child[index]

      return existing if existing == site

			self.remove_site(index) if existing

      @children << site
      @site_child[index] = site

      site.add_parent(self)

      changed
      return site
    end
  
    def new_site(index)
      accessed

      site = nil
      site = Site.lookup(index) if Xampl.persister and Xampl.persister.automatic
      site = Site.new(index) unless site

      yield(site) if block_given?
      return add_site(site)
    end

    def ensure_site(index)
      accessed

      site = @site_child[index]
		  return site if site 

      site = Site.lookup(index) if Xampl.persister and Xampl.persister.automatic
      site = Site.new(index) unless site

      yield(site) if block_given?
      return add_site(site)
		end

    def remove_site(index)
      accessed
			changed
	    unless String === index or Symbol === index then
        index = index.get_the_index
			end
      site = @site_child.delete(index) if index
      @children.delete(site)
    end
  end

  module PageAsChild
    require "xamplr/indexed-array"
  
    def page_child
      accessed
      @page_child
    end

    def page_child=(v)
      accessed
      @page_child = v
    end

    alias page page_child
    alias page= page_child=
  
    def init_page_as_child
      @page_child = IndexedArray.new
    end
  
    def add_page(page)
      accessed
      index = page.get_the_index
      if(nil == index) then
        raise Xampl::XamplException.new("no value for the index 'id' of page defined in : " << page.pp_xml)
      end

      existing = @page_child[index]

      return existing if existing == page

			self.remove_page(index) if existing

      @children << page
      @page_child[index] = page

      page.add_parent(self)

      changed
      return page
    end
  
    def new_page(index)
      accessed

      page = nil
      page = Page.new(index) unless page

      yield(page) if block_given?
      return add_page(page)
    end

    def ensure_page(index)
      accessed

      page = @page_child[index]
		  return page if page 

      page = Page.new(index) unless page

      yield(page) if block_given?
      return add_page(page)
		end

    def remove_page(index)
      accessed
			changed
	    unless String === index or Symbol === index then
        index = index.get_the_index
			end
      page = @page_child.delete(index) if index
      @children.delete(page)
    end
  end

  module PageVersionAsChild
    require "xamplr/indexed-array"
  
    def page_version_child
      accessed
      @page_version_child
    end

    def page_version_child=(v)
      accessed
      @page_version_child = v
    end

    alias page_version page_version_child
    alias page_version= page_version_child=
  
    def init_page_version_as_child
      @page_version_child = IndexedArray.new
    end
  
    def add_page_version(page_version)
      accessed
      index = page_version.get_the_index
      if(nil == index) then
        raise Xampl::XamplException.new("no value for the index 'id' of page_version defined in : " << page_version.pp_xml)
      end

      existing = @page_version_child[index]

      return existing if existing == page_version

			self.remove_page_version(index) if existing

      @children << page_version
      @page_version_child[index] = page_version

      page_version.add_parent(self)

      changed
      return page_version
    end
  
    def new_page_version(index)
      accessed

      page_version = nil
      page_version = PageVersion.new(index) unless page_version

      yield(page_version) if block_given?
      return add_page_version(page_version)
    end

    def ensure_page_version(index)
      accessed

      page_version = @page_version_child[index]
		  return page_version if page_version 

      page_version = PageVersion.new(index) unless page_version

      yield(page_version) if block_given?
      return add_page_version(page_version)
		end

    def remove_page_version(index)
      accessed
			changed
	    unless String === index or Symbol === index then
        index = index.get_the_index
			end
      page_version = @page_version_child.delete(index) if index
      @children.delete(page_version)
    end
  end

  module MemberAsChild
    require "xamplr/indexed-array"
  
    def member_child
      accessed
      @member_child
    end

    def member_child=(v)
      accessed
      @member_child = v
    end

    alias member member_child
    alias member= member_child=
  
    def init_member_as_child
      @member_child = IndexedArray.new
    end
  
    def add_member(member)
      accessed
      index = member.get_the_index
      if(nil == index) then
        raise Xampl::XamplException.new("no value for the index 'pid' of member defined in : " << member.pp_xml)
      end

      existing = @member_child[index]

      return existing if existing == member

			self.remove_member(index) if existing

      @children << member
      @member_child[index] = member

      member.add_parent(self)

      changed
      return member
    end
  
    def new_member(index)
      accessed

      member = nil
      member = Member.lookup(index) if Xampl.persister and Xampl.persister.automatic
      member = Member.new(index) unless member

      yield(member) if block_given?
      return add_member(member)
    end

    def ensure_member(index)
      accessed

      member = @member_child[index]
		  return member if member 

      member = Member.lookup(index) if Xampl.persister and Xampl.persister.automatic
      member = Member.new(index) unless member

      yield(member) if block_given?
      return add_member(member)
		end

    def remove_member(index)
      accessed
			changed
	    unless String === index or Symbol === index then
        index = index.get_the_index
			end
      member = @member_child.delete(index) if index
      @children.delete(member)
    end
  end

  module AccessAsChild
    require "xamplr/indexed-array"
  
    def access_child
      accessed
      @access_child
    end

    def access_child=(v)
      accessed
      @access_child = v
    end

    alias access access_child
    alias access= access_child=
  
    def init_access_as_child
      @access_child = IndexedArray.new
    end
  
    def add_access(access)
      accessed
      index = access.get_the_index
      if(nil == index) then
        raise Xampl::XamplException.new("no value for the index 'id' of access defined in : " << access.pp_xml)
      end

      existing = @access_child[index]

      return existing if existing == access

			self.remove_access(index) if existing

      @children << access
      @access_child[index] = access

      access.add_parent(self)

      changed
      return access
    end
  
    def new_access(index)
      accessed

      access = nil
      access = Access.new(index) unless access

      yield(access) if block_given?
      return add_access(access)
    end

    def ensure_access(index)
      accessed

      access = @access_child[index]
		  return access if access 

      access = Access.new(index) unless access

      yield(access) if block_given?
      return add_access(access)
		end

    def remove_access(index)
      accessed
			changed
	    unless String === index or Symbol === index then
        index = index.get_the_index
			end
      access = @access_child.delete(index) if index
      @children.delete(access)
    end
  end

  class Stripes
    include Xampl::XamplPersistedObject

    @@default_persister_format = nil

    def default_persister_format
      @@default_persister_format
    end
    def Stripes.default_persister_format
      @@default_persister_format
    end
    def Stripes.set_default_persister_format(format)
      @@default_persister_format = format
    end

    def Stripes.find_by_query
      things = Xampl.find_xampl do | q |
         q.add_condition('class', :equals, self.name)
         yield(q)
       end
    end


    include Xampl::XamplWithDataContent

    @@tag = "stripes"
    @@ns = "http://www.soldierofcode.com/stripes"
    @@ns_tag = "{http://www.soldierofcode.com/stripes}stripes"
    @@module_name = "App"
    @@safe_name = "App_stripes"
    @@attributes = [
                     [ :@pid, "pid" ],
                     [ :@scheduled_for_deletion_at, "scheduled-for-deletion-at" ],
                   ]
    include App::SiteAsChild
    include App::MemberAsChild


    def Stripes.lookup(pid)
      Xampl.lookup(Stripes, pid)
    end

    def Stripes.[](pid)
      Xampl.lookup(Stripes, pid)
    end

    def pid
      @pid
    end

    def pid=(v)
      accessed
			# This is kind of optimistic, I think you are in trouble if you do this
      Xampl.auto_uncache(self) if @pid
      @pid = v
      changed
      Xampl.auto_cache(self) if v
    end

    def scheduled_for_deletion_at
      accessed
      @scheduled_for_deletion_at
    end

    def scheduled_for_deletion_at=(v)
     accessed
     changed
     @scheduled_for_deletion_at = v
    end

    def initialize(index=nil)
      @pid = index if index
      super()

      @pid = nil if not defined? @pid
      @scheduled_for_deletion_at = nil if not defined? @scheduled_for_deletion_at

      init_xampl_object
      init_data_content
      init_site_as_child
      init_member_as_child

      yield(self) if block_given?
      init_hook

      changed
    end

    def clear_non_persistent_index_attributes
      @scheduled_for_deletion_at = nil
    end

    def append_to(other)
      other.add_stripes(self)
    end

    def Stripes.persisted?
      return :pid
    end

    def persisted?
      return :pid
    end

    def Stripes.tag
      @@tag
    end

    def Stripes.ns
      @@ns
    end

    def Stripes.ns_tag
      @@ns_tag
    end

    def Stripes.safe_name
      @@safe_name
    end

    def Stripes.module_name
      @@module_name
    end

    def tag
      @@tag
    end

    def ns
      @@ns
    end

    def ns_tag
      @@ns_tag
    end

    def safe_name
      @@safe_name
    end

    def module_name
      @@module_name
    end

    def attributes
      @@attributes
    end

    def indexed_by
      :pid
    end

    def get_the_index
      @pid
    end

    def set_the_index(index)
      @pid = index
    end

    def substitute_in_visit(visitor)
      return visitor.substitute_in_visit_stripes(self) || self
    end

    def before_visit(visitor)
      visitor.before_visit_stripes(self)
    end

    def visit(visitor)
      visitor.visit_stripes(self)
    end

    def after_visit(visitor)
      visitor.after_visit_stripes(self)
    end

    Xampl::FromXML::register(Stripes::tag, Stripes::ns_tag, Stripes)
  end

  class Site
    include Xampl::XamplPersistedObject

    @@default_persister_format = nil

    def default_persister_format
      @@default_persister_format
    end
    def Site.default_persister_format
      @@default_persister_format
    end
    def Site.set_default_persister_format(format)
      @@default_persister_format = format
    end

    def Site.find_by_query
      things = Xampl.find_xampl do | q |
         q.add_condition('class', :equals, self.name)
         yield(q)
       end
    end


    include Xampl::XamplWithDataContent

    @@tag = "site"
    @@ns = "http://www.soldierofcode.com/stripes"
    @@ns_tag = "{http://www.soldierofcode.com/stripes}site"
    @@module_name = "App"
    @@safe_name = "App_site"
    @@attributes = [
                     [ :@name, "name" ],
                     [ :@title, "title" ],
                     [ :@pid, "pid" ],
                     [ :@scheduled_for_deletion_at, "scheduled-for-deletion-at" ],
                   ]
    include App::PageAsChild


    def Site.lookup(pid)
      Xampl.lookup(Site, pid)
    end

    def Site.[](pid)
      Xampl.lookup(Site, pid)
    end

    def name
      accessed
      @name
    end

    def name=(v)
     accessed
     changed
     @name = v
    end

    def title
      accessed
      @title
    end

    def title=(v)
     accessed
     changed
     @title = v
    end

    def pid
      @pid
    end

    def pid=(v)
      accessed
			# This is kind of optimistic, I think you are in trouble if you do this
      Xampl.auto_uncache(self) if @pid
      @pid = v
      changed
      Xampl.auto_cache(self) if v
    end

    def scheduled_for_deletion_at
      accessed
      @scheduled_for_deletion_at
    end

    def scheduled_for_deletion_at=(v)
     accessed
     changed
     @scheduled_for_deletion_at = v
    end

    def initialize(index=nil)
      @pid = index if index
      super()

      @name = nil if not defined? @name
      @title = nil if not defined? @title
      @pid = nil if not defined? @pid
      @scheduled_for_deletion_at = nil if not defined? @scheduled_for_deletion_at

      init_xampl_object
      init_data_content
      init_page_as_child

      yield(self) if block_given?
      init_hook

      changed
    end

    def clear_non_persistent_index_attributes
      @name = nil
      @title = nil
      @scheduled_for_deletion_at = nil
    end

    def append_to(other)
      other.add_site(self)
    end

    def Site.persisted?
      return :pid
    end

    def persisted?
      return :pid
    end

    def Site.tag
      @@tag
    end

    def Site.ns
      @@ns
    end

    def Site.ns_tag
      @@ns_tag
    end

    def Site.safe_name
      @@safe_name
    end

    def Site.module_name
      @@module_name
    end

    def tag
      @@tag
    end

    def ns
      @@ns
    end

    def ns_tag
      @@ns_tag
    end

    def safe_name
      @@safe_name
    end

    def module_name
      @@module_name
    end

    def attributes
      @@attributes
    end

    def indexed_by
      :pid
    end

    def get_the_index
      @pid
    end

    def set_the_index(index)
      @pid = index
    end

    def substitute_in_visit(visitor)
      return visitor.substitute_in_visit_site(self) || self
    end

    def before_visit(visitor)
      visitor.before_visit_site(self)
    end

    def visit(visitor)
      visitor.visit_site(self)
    end

    def after_visit(visitor)
      visitor.after_visit_site(self)
    end

    Xampl::FromXML::register(Site::tag, Site::ns_tag, Site)
  end

  class Page
    include Xampl::XamplObject
    include Xampl::XamplWithDataContent

    @@tag = "page"
    @@ns = "http://www.soldierofcode.com/stripes"
    @@ns_tag = "{http://www.soldierofcode.com/stripes}page"
    @@module_name = "App"
    @@safe_name = "App_page"
    @@attributes = [
                     [ :@id, "id" ],
                     [ :@state, "state" ],
                     [ :@date_created, "date-created" ],
                   ]
    include App::PageVersionAsChild


    def id
      accessed
      @id
    end

    def id=(v)
     accessed
     changed
     @id = v
    end

    def state
      accessed
      @state
    end

    def state=(v)
     accessed
     changed
     @state = v
    end

    def date_created
      accessed
      @date_created
    end

    def date_created=(v)
     accessed
     changed
     @date_created = v
    end

    def initialize(index=nil)
      @id = index if index
      super()

      @id = nil if not defined? @id
      @state = nil if not defined? @state
      @date_created = nil if not defined? @date_created

      init_xampl_object
      init_data_content
      init_page_version_as_child

      yield(self) if block_given?
      init_hook

      changed
    end

    def clear_non_persistent_index_attributes
      @id = nil
      @state = nil
      @date_created = nil
    end

    def append_to(other)
      other.add_page(self)
    end

    def Page.persisted?
      return nil
    end

    def persisted?
      return nil
    end

    def Page.tag
      @@tag
    end

    def Page.ns
      @@ns
    end

    def Page.ns_tag
      @@ns_tag
    end

    def Page.safe_name
      @@safe_name
    end

    def Page.module_name
      @@module_name
    end

    def tag
      @@tag
    end

    def ns
      @@ns
    end

    def ns_tag
      @@ns_tag
    end

    def safe_name
      @@safe_name
    end

    def module_name
      @@module_name
    end

    def attributes
      @@attributes
    end

    def indexed_by
      :id
    end

    def get_the_index
      @id
    end

    def set_the_index(index)
      @id = index
    end

    def substitute_in_visit(visitor)
      return visitor.substitute_in_visit_page(self) || self
    end

    def before_visit(visitor)
      visitor.before_visit_page(self)
    end

    def visit(visitor)
      visitor.visit_page(self)
    end

    def after_visit(visitor)
      visitor.after_visit_page(self)
    end

    Xampl::FromXML::register(Page::tag, Page::ns_tag, Page)
  end

  class PageVersion
    include Xampl::XamplObject
    include Xampl::XamplWithSimpleContent

    @@tag = "page-version"
    @@ns = "http://www.soldierofcode.com/stripes"
    @@ns_tag = "{http://www.soldierofcode.com/stripes}page-version"
    @@module_name = "App"
    @@safe_name = "App_page_version"
    @@attributes = [
                     [ :@id, "id" ],
                     [ :@date_created, "date_created" ],
                     [ :@who_created, "who_created" ],
                     [ :@name, "name" ],
                     [ :@title, "title" ],
                     [ :@state, "state" ],
                     [ :@content, "content" ],
                   ]

    def id
      accessed
      @id
    end

    def id=(v)
      accessed
      changed
      @id = v
    end

    def date_created
      accessed
      @date_created
    end

    def date_created=(v)
      accessed
      changed
      @date_created = v
    end

    def who_created
      accessed
      @who_created
    end

    def who_created=(v)
      accessed
      changed
      @who_created = v
    end

    def name
      accessed
      @name
    end

    def name=(v)
      accessed
      changed
      @name = v
    end

    def title
      accessed
      @title
    end

    def title=(v)
      accessed
      changed
      @title = v
    end

    def state
      accessed
      @state
    end

    def state=(v)
      accessed
      changed
      @state = v
    end

    def content
      accessed
      @content
    end

    def content=(v)
      accessed
      changed
      @content = v
    end

    def initialize(index=nil)
      @id = index if index
      super()

      @id = nil if not defined? @id
      @date_created = nil if not defined? @date_created
      @who_created = nil if not defined? @who_created
      @name = nil if not defined? @name
      @title = nil if not defined? @title
      @state = nil if not defined? @state
      @content = nil if not defined? @content

      init_xampl_object

      yield(self) if block_given?
      init_hook

      changed
    end

    def clear_non_persistent_index_attributes
      @id = nil
      @date_created = nil
      @who_created = nil
      @name = nil
      @title = nil
      @state = nil
      @content = nil
    end

    def append_to(other)
      other.add_page_version(self)
    end

    def PageVersion.persisted?
      return nil
    end

    def persisted?
      return nil
    end

    def PageVersion.tag
      @@tag
    end

    def PageVersion.ns
      @@ns
    end

    def PageVersion.ns_tag
      @@ns_tag
    end

    def PageVersion.safe_name
      @@safe_name
    end

    def PageVersion.module_name
      @@module_name
    end

    def tag
      @@tag
    end

    def ns
      @@ns
    end

    def ns_tag
      @@ns_tag
    end

    def safe_name
      @@safe_name
    end

    def module_name
      @@module_name
    end

    def attributes
      @@attributes
    end

    def indexed_by
      :id
    end

    def get_the_index
      @id
    end

    def set_the_index(index)
      @id = index
    end

    def substitute_in_visit(visitor)
      return visitor.substitute_in_visit_page_version(self) || self
    end

    def before_visit(visitor)
      visitor.before_visit_page_version(self)
    end

    def visit(visitor)
      visitor.visit_page_version(self)
    end

    def after_visit(visitor)
      visitor.after_visit_page_version(self)
    end

    Xampl::FromXML::register(PageVersion::tag, PageVersion::ns_tag, PageVersion)
  end

  class Member
    include Xampl::XamplPersistedObject

    @@default_persister_format = nil

    def default_persister_format
      @@default_persister_format
    end
    def Member.default_persister_format
      @@default_persister_format
    end
    def Member.set_default_persister_format(format)
      @@default_persister_format = format
    end

    def Member.find_by_query
      things = Xampl.find_xampl do | q |
         q.add_condition('class', :equals, self.name)
         yield(q)
       end
    end


    include Xampl::XamplWithDataContent

    @@tag = "member"
    @@ns = "http://www.soldierofcode.com/stripes"
    @@ns_tag = "{http://www.soldierofcode.com/stripes}member"
    @@module_name = "App"
    @@safe_name = "App_member"
    @@attributes = [
                     [ :@pid, "pid" ],
                     [ :@name, "name" ],
                     [ :@md5_password, "md5-password" ],
                     [ :@token, "token" ],
                     [ :@scheduled_for_deletion_at, "scheduled-for-deletion-at" ],
                   ]
    include App::AccessAsChild


    def Member.lookup(pid)
      Xampl.lookup(Member, pid)
    end

    def Member.[](pid)
      Xampl.lookup(Member, pid)
    end

    def pid
      @pid
    end

    def pid=(v)
      accessed
			# This is kind of optimistic, I think you are in trouble if you do this
      Xampl.auto_uncache(self) if @pid
      @pid = v
      changed
      Xampl.auto_cache(self) if v
    end

    def name
      accessed
      @name
    end

    def name=(v)
     accessed
     changed
     @name = v
    end

    def md5_password
      accessed
      @md5_password
    end

    def md5_password=(v)
     accessed
     changed
     @md5_password = v
    end

    def token
      accessed
      @token
    end

    def token=(v)
     accessed
     changed
     @token = v
    end

    def scheduled_for_deletion_at
      accessed
      @scheduled_for_deletion_at
    end

    def scheduled_for_deletion_at=(v)
     accessed
     changed
     @scheduled_for_deletion_at = v
    end

    def initialize(index=nil)
      @pid = index if index
      super()

      @pid = nil if not defined? @pid
      @name = nil if not defined? @name
      @md5_password = nil if not defined? @md5_password
      @token = nil if not defined? @token
      @scheduled_for_deletion_at = nil if not defined? @scheduled_for_deletion_at

      init_xampl_object
      init_data_content
      init_access_as_child

      yield(self) if block_given?
      init_hook

      changed
    end

    def clear_non_persistent_index_attributes
      @name = nil
      @md5_password = nil
      @token = nil
      @scheduled_for_deletion_at = nil
    end

    def append_to(other)
      other.add_member(self)
    end

    def Member.persisted?
      return :pid
    end

    def persisted?
      return :pid
    end

    def Member.tag
      @@tag
    end

    def Member.ns
      @@ns
    end

    def Member.ns_tag
      @@ns_tag
    end

    def Member.safe_name
      @@safe_name
    end

    def Member.module_name
      @@module_name
    end

    def tag
      @@tag
    end

    def ns
      @@ns
    end

    def ns_tag
      @@ns_tag
    end

    def safe_name
      @@safe_name
    end

    def module_name
      @@module_name
    end

    def attributes
      @@attributes
    end

    def indexed_by
      :pid
    end

    def get_the_index
      @pid
    end

    def set_the_index(index)
      @pid = index
    end

    def substitute_in_visit(visitor)
      return visitor.substitute_in_visit_member(self) || self
    end

    def before_visit(visitor)
      visitor.before_visit_member(self)
    end

    def visit(visitor)
      visitor.visit_member(self)
    end

    def after_visit(visitor)
      visitor.after_visit_member(self)
    end

    Xampl::FromXML::register(Member::tag, Member::ns_tag, Member)
  end

  class Access
    include Xampl::XamplObject
    include Xampl::XamplWithDataContent

    @@tag = "access"
    @@ns = "http://www.soldierofcode.com/stripes"
    @@ns_tag = "{http://www.soldierofcode.com/stripes}access"
    @@module_name = "App"
    @@safe_name = "App_access"
    @@attributes = [
                     [ :@id, "id" ],
                   ]
    include App::SiteAsChild


    def id
      accessed
      @id
    end

    def id=(v)
     accessed
     changed
     @id = v
    end

    def initialize(index=nil)
      @id = index if index
      super()

      @id = nil if not defined? @id

      init_xampl_object
      init_data_content
      init_site_as_child

      yield(self) if block_given?
      init_hook

      changed
    end

    def clear_non_persistent_index_attributes
      @id = nil
    end

    def append_to(other)
      other.add_access(self)
    end

    def Access.persisted?
      return nil
    end

    def persisted?
      return nil
    end

    def Access.tag
      @@tag
    end

    def Access.ns
      @@ns
    end

    def Access.ns_tag
      @@ns_tag
    end

    def Access.safe_name
      @@safe_name
    end

    def Access.module_name
      @@module_name
    end

    def tag
      @@tag
    end

    def ns
      @@ns
    end

    def ns_tag
      @@ns_tag
    end

    def safe_name
      @@safe_name
    end

    def module_name
      @@module_name
    end

    def attributes
      @@attributes
    end

    def indexed_by
      :id
    end

    def get_the_index
      @id
    end

    def set_the_index(index)
      @id = index
    end

    def substitute_in_visit(visitor)
      return visitor.substitute_in_visit_access(self) || self
    end

    def before_visit(visitor)
      visitor.before_visit_access(self)
    end

    def visit(visitor)
      visitor.visit_access(self)
    end

    def after_visit(visitor)
      visitor.after_visit_access(self)
    end

    Xampl::FromXML::register(Access::tag, Access::ns_tag, Access)
  end

end
