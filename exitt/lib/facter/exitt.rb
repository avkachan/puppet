Facter.add(:mora) do
	setcode do
	if $::hostname == 'master' 
		mora = 'master'
	else  mora = 'agent'
	
end
end	


