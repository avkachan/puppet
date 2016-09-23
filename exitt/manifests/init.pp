class exitt {
	if $::mora == master{
		include exitt::master
	}

	elsif $::mora == agent {
		include exitt::agent
	}
	else {
		notice('smth'
	}
}
		
