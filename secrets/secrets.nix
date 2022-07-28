let
  cofob = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIETMEzhigdZelWae3V4tQ7/LXsub39SRG2X+jPMeoHMx";
  users = [ cofob ];

  bear = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFQKu0ZgZc02N+HguIs4Ur50p6A4l9SxpRWGxsQGcViN";
  systems = [ bear ];
in
{
  "passwords/cofob.age".publicKeys = users ++ systems;
}
