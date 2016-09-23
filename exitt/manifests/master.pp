class exitt::master {
	exec { 'root_bash_profile':
		command => 'source /root/.bash_profile',
		provider => shell,
	}


	host { 'agent.minsk.epam.com':
		host_aliases => 'agent',
		ip => '192.168.25.201',
	}
		
	package { 'puppet-repo': 
		ensure  => installed,
		provider => rpm,
		source => 'https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm'
	}
	
	package { 'puppetserver': 
		ensure => 'installed',
		require => Package['puppet-repo']
	}

	file { '/etc/puppetlabs/puppet/autosign.conf':
		content => template('exitt/autosign.erb'),
		ensure  => file,
		owner   => root,
		group   => root,
		mode => '0644',
	}
	
	service { 'puppetserver':
		ensure => 'running',
		require => File['/etc/puppetlabs/puppet/autosign.conf'],
	}
}
