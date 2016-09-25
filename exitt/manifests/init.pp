#
#
class exitt {
  if $::mora == 'true' {
  include exitt::master
}
  else {
  include exitt::agent
}
}
