require File.join(File.dirname(__FILE__), "/generated_model/App" )

module App

  # By default we want to use tokyo cabinet as our persistor
  # this could be changed to :in_memory
  Xampl.set_default_persister_kind(:tokyo_cabinet)

  def App.persistence_type
    Xampl.default_persister_kind
  end

  def App.root
    $root_requests = 0 unless $root_requests
    $new_root_counter = 0 unless $new_root_counter
    $root_requests += 1

    root = Stripes['repo']

    return root if root

    root = Stripes.lookup('repo')
    return root if root

    $new_root_counter += 1

    Stripes.new('repo') do | it |
      #it.setup_defaults
    end
  end
end
