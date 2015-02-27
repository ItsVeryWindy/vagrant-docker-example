ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'
 
Vagrant.configure("2") do |config|
  config.vm.provider "docker" do |d|
    d.build_dir = "."
	d.ports = ['3000:3000']
	d.name = 'node-container'
	d.vagrant_vagrantfile = "./host/Vagrantfile"
  end
  
  config.vm.network :forwarded_port, guest: 3000, host: 3000, id: "http"    # HTTP
  config.vm.synced_folder "./app", "/app", disabled: true
  
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box

    config.cache.synced_folder_opts = {
      type: :nfs,
      mount_options: ['rw', 'vers=3', 'tcp', 'nolock']
    }
  end
end