let
  cofob = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIETMEzhigdZelWae3V4tQ7/LXsub39SRG2X+jPMeoHMx";
  users = [ cofob ];

  personal = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPBVz/lhiMam5Pz39QtS4Gm13gIVqdrtnlVSeuS/+7Wg";
  systems = [ personal ];
in
{
  "secrets/passwords/cofob.age".publicKeys = users ++ systems;
}