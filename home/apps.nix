{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    qbittorrent
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

          "browser.startup.homepage" = "https://duckduckgo.com/";
          "general.useragent.locale" = "en-US";
          "browser.search.region" = "RU";
          "browser.search.isUS" = false;

          # Set theme
          "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";

          # Disable sponsored sites (Amazon and similar shit)
          "browser.newtabpage.activity-stream.showSponsored" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;

          # Set download dir
          "browser.download.lastDir" = "/home/vad/Downloads";

          "devtools.everOpened" = true;

          # HTTPS-only
          "dom.security.https_only_mode" = true;

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
