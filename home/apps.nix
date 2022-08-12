{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    kotatogram-desktop
    deltachat-desktop
    bitwarden
    polymc
    mumble
    nheko
    vlc
  ];

  manual.html.enable = true;

  services.kdeconnect.enable = true;

  programs.firefox = {
    enable = true;
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      # AdBlock
      adnauseam

      # Privacy
      foxyproxy-standard
      privacy-badger

      # Optimizations
      auto-tab-discard
      decentraleyes
      clearurls

      # Other
      i-dont-care-about-cookies
      ipfs-companion
      darkreader
    ];
    profiles = {
      default = {
        isDefault = true;
        settings = {
          # Disable "about:config" warn
          "browser.aboutConfig.showWarning" = false;

          # Remove import bookmarks button and remove default bookmarks
          "browser.bookmarks.restore_default_bookmarks" = false;
          "browser.bookmarks.addedImportButton" = true;
          # Disable top bookmarks
          "browser.toolbars.bookmarks.visibility" = "never";

          # Overwrite welcome page
          "startup.homepage_welcome_url" = "https://nixos.org";

          # Disable auto update
          "app.update.checkInstallTime" = false;
          "app.update.auto" = false;

          # Strict protection
          "browser.contentblocking.category" = "strict";

          # Disable login saving
          "signon.management.page.breach-alerts.enabled" = false;
          "signon.rememberSignons" = false;

          "browser.startup.homepage" = "https://search.nixos.org";
          "general.useragent.locale" = "en-US";
          "browser.search.region" = "RU";
          "browser.search.isUS" = false;

          # Alfis, I2P, tor TLD's
          "browser.fixup.domainsuffixwhitelist.mirror" = true;
          "browser.fixup.domainsuffixwhitelist.screen" = true;
          "browser.fixup.domainsuffixwhitelist.merch" = true;
          "browser.fixup.domainsuffixwhitelist.index" = true;
          "browser.fixup.domainsuffixwhitelist.onion" = true;
          "browser.fixup.domainsuffixwhitelist.anon" = true;
          "browser.fixup.domainsuffixwhitelist.conf" = true;
          "browser.fixup.domainsuffixwhitelist.ygg" = true;
          "browser.fixup.domainsuffixwhitelist.srv" = true;
          "browser.fixup.domainsuffixwhitelist.btn" = true;
          "browser.fixup.domainsuffixwhitelist.mob" = true;
          "browser.fixup.domainsuffixwhitelist.i2p" = true;

          # Set download dir
          "browser.download.lastDir" = "/home/cofob/Downloads";

          # Browser UI customization
          "browser.uiCustomization.state" = ''{"placements":{"widget-overflow-fixed-list":["downloads-button","jid1-mnnxcxisbpnsxq_jetpack-browser-action","ipfs-firefox-addon_lidel_org-browser-action","jid1-kkzogwgsw3ao4q_jetpack-browser-action","foxyproxy_eric_h_jung-browser-action","jid1-bofifl9vbdl2zq_jetpack-browser-action","_74145f27-f039-47ce-a470-a662b129930a_-browser-action","_c2c003ee-bd69-42a2-b0e9-6f34222cb046_-browser-action","adnauseam_rednoise_org-browser-action","addon_darkreader_org-browser-action"],"nav-bar":["back-button","forward-button","urlbar-container"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","new-tab-button","alltabs-button"],"PersonalToolbar":["personal-bookmarks"]},"seen":["save-to-pocket-button","developer-button","adnauseam_rednoise_org-browser-action","_c2c003ee-bd69-42a2-b0e9-6f34222cb046_-browser-action","_74145f27-f039-47ce-a470-a662b129930a_-browser-action","jid1-bofifl9vbdl2zq_jetpack-browser-action","foxyproxy_eric_h_jung-browser-action","jid1-kkzogwgsw3ao4q_jetpack-browser-action","ipfs-firefox-addon_lidel_org-browser-action","jid1-mnnxcxisbpnsxq_jetpack-browser-action","addon_darkreader_org-browser-action"],"dirtyAreaCache":["nav-bar","toolbar-menubar","TabsToolbar","PersonalToolbar","widget-overflow-fixed-list"],"currentVersion":17,"newElementCount":6}'';

          "devtools.everOpened" = true;

          # Yggdrasil tweaks
          "network.http.fast-fallback-to-IPv4" = false;
          "browser.fixup.fallback-to-https" = false;
          "browser.fixup.alternate.enabled" = false;
          "network.dns.disableIPv6" = false;

          # telemetry
          "browser.newtabpage.activity-stream.feeds.telemetry" = false;
          "browser.newtabpage.activity-stream.telemetry" = false;
          "toolkit.telemetry.shutdownPingSender.enabled" = false;
          "toolkit.telemetry.firstShutdownPing.enabled" = false;
          "toolkit.telemetry.reportingpolicy.firstRun" = false;
          "datareporting.policy.dataSubmissionEnabled" = false;
          "toolkit.telemetry.newProfilePing.enabled" = false;
          "datareporting.healthreport.uploadEnabled" = false;
          "toolkit.telemetry.hybridContent.enabled" = false;
          "devtools.onboarding.telemetry.logged" = false;
          "toolkit.telemetry.updatePing.enabled" = false;
          "datareporting.sessions.current.clean" = true;
          "toolkit.telemetry.bhrPing.enabled" = false;
          "toolkit.telemetry.archive.enabled" = false;
          "browser.ping-centre.telemetry" = false;
          "toolkit.telemetry.server_owner" = "";
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.server" = "";
        };
      };
    };
  };
}
