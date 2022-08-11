{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs.unstable; [
    kotatogram-desktop
    deltachat-desktop
    bitwarden
    mumble
    nheko
    vlc
  ];

  manual.html.enable = true;

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
          "browser.uiCustomization.state" = ''{"placements":{"widget-overflow-fixed-list":["downloads-button"],"nav-bar":["back-button","forward-button","urlbar-container"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","new-tab-button","alltabs-button"],"PersonalToolbar":["personal-bookmarks"]},"seen":["save-to-pocket-button","developer-button"],"dirtyAreaCache":["nav-bar","toolbar-menubar","TabsToolbar","PersonalToolbar","widget-overflow-fixed-list"],"currentVersion":17,"newElementCount":5}'';

          "devtools.everOpened" = true;

          # Extensions ID's (this maybe fix new install deactivated extensions bug, but IDK)
          "extensions.webextensions.uuids" = ''{"foxyproxy@eric.h.jung":"9ff6eb48-79f4-4929-a6e9-22893038d26f","jid1-KKzOGWgsW3Ao4Q@jetpack":"3e2d3cd8-5e4b-446e-a30f-c7944457ca13","adnauseam@rednoise.org":"8c5707a1-8dd7-4821-a5b1-f55f12fba7e8","{74145f27-f039-47ce-a470-a662b129930a}":"b540c37d-62e7-448e-9c81-840669c1dfa0","ipfs-firefox-addon@lidel.org":"558bb4ac-2e1d-430f-a41c-7ab2806c2809","jid1-MnnxcxisBPnSXQ@jetpack":"72e08e59-f184-4515-ba2d-b6f383d2d364","jid1-BoFifL9Vbdl2zQ@jetpack":"4d559885-2491-470a-8459-8f4a73009126","doh-rollout@mozilla.org":"8f387313-b10a-4134-a5ff-e2edd8ac567a","formautofill@mozilla.org":"057c6f69-0eb0-4b05-88dd-6a153caad52f","pictureinpicture@mozilla.org":"683a97dc-e2aa-4248-867e-0d1888eebe5e","screenshots@mozilla.org":"2d7895b3-91e6-46f4-abd2-511a4e76ff9f","webcompat-reporter@mozilla.org":"626a9e19-a5d2-4108-acca-a58edb867c89","webcompat@mozilla.org":"dc9204d2-ee1f-4043-a7bb-51f6ba6eb4b6","default-theme@mozilla.org":"7e9f630d-309b-4b2f-8299-856f7cac2f36","addons-search-detection@mozilla.com":"9de33131-3aae-49d0-92c8-3b3b3abbf87b","google@search.mozilla.org":"5d65312c-317d-4043-bfa1-8aab68c0e83f","amazondotcom@search.mozilla.org":"6afc7f13-46f8-41f1-b6d6-5c48ba86ada5","wikipedia@search.mozilla.org":"e328850c-ff00-49ab-891b-111ea2c99b2e","bing@search.mozilla.org":"d2e7e531-2d40-4f48-b970-4000142186ce","ddg@search.mozilla.org":"c4cfd2fe-7fbd-4937-891a-3770876dc5d2"}'';

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
