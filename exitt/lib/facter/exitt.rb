Facter.add(:mora) do
 setcode do
  Facter.value(:hostname) == 'master'	
end
end	


