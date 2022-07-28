let
  cofob = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIETMEzhigdZelWae3V4tQ7/LXsub39SRG2X+jPMeoHMx";
  users = [ cofob ];

  bear = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJxE1dSCkVnBcjNM1dvEEEEvxZ4F+FkOr6fVh+V9wotS";
  systems = [ bear ];
in
{
  "./passwords/cofob.age".publicKeys = users ++ systems;
}
