$agent_1 = 'agent'
$master_1 = 'master'
$domain_1 = '.minsk.epam.com'
if $::hostname == 'master' {
	notice ( "Hostname is ${::hostname}" )
	
	package { 'puppetserver': 
		ensure => 'installed',
		require => File['/etc/hosts'],
		}

	exec { 'root_bash_profile':
		command     => 'source /root/.bash_profile',
		provider => shell,
		}

	service { 'puppet':
		ensure => 'running',
		}

	service { 'puppetserver':
		ensure => 'running',
		require => package['puppetserver'],
		}
	
	file { '/etc/hosts':
		content => template('/vagrant/templates/hosts_master.erb'),
		owner   => root,
		group   => root,
		mode    => '644',
		
	}
}
 
else {
	notice ( "Hostname is ${::hostname}" )
      
	package { 'puppet-agent':
		ensure => 'latest',
		require => File['puppet-agent'],
		}

	service { 'puppet':
		ensure => 'running',
		require => package['puppet-agent']     
		}
	
	file { '/etc/hosts':
		content => template('/vagrant/templates/hosts_agent.erb'),
		owner   => root,
		group   => root,
		mode    => '644',
	}	
         
}
 
notice ( "something in the end of the pp" )
