class exitt {
	if $::hostname == master{
		include exitt::master
	}

	else $::hostname == agent {
		include exitt::agent
	}
}
		
