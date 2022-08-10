let
  cofob = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIETMEzhigdZelWae3V4tQ7/LXsub39SRG2X+jPMeoHMx";
  users = [ cofob ];

  bear = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICxTTHyhhZTc6pw+p55FfRZeuUqvHLy4RGGcZD1m9Nbf";
  fly = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAZSe9TpBb+AIZtlo2GezTlwLrGqVdsGRD88Y+UH/urj";
  systems = [ bear fly ];
in
{
  "./passwords/cofob.age".publicKeys = users ++ systems;
}
