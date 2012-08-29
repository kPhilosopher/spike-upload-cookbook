package "vim" do
	action [:install]
end

template "/home/vagrant/.vimrc" do
	source "vimrc.erb"
	owner "vagrant"
	group "vagrant"
	mode 0600
	personName = "no such person"
	node[:personNames].each_key do |key|
		if node[:fqdn] == key
			personName = node[:personNames][key]
		end
	end
	variables({
		:person => personName		
	})
end
