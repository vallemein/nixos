{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    kotatogram-desktop
    libreoffice-fresh
    element-desktop
    bitwarden
    discord
  ];

  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        isDefault = true;
        settings = {
          # Disable "about:config" warn
          "browser.aboutConfig.showWarning" = false;

          # Remove import bookmarks button and remove default bookmarks
          "browser.bookmarks.addedImportButton" = true;
          "browser.bookmarks.restore_default_bookmarks" = false;

          # Overwrite welcome page
          "startup.homepage_welcome_url" = "https://nixos.org";

          # Disable auto update
          "app.update.auto" = false;
          "app.update.checkInstallTime" = false;

          # Strict protection
          "browser.contentblocking.category" = "strict";

          # Disable login saving
          "signon.rememberSignons" = false;
          "signon.management.page.breach-alerts.enabled" = false;

          "browser.startup.homepage" = "https://search.nixos.org";
          "browser.search.region" = "RU";
          "browser.search.isUS" = false;
          "general.useragent.locale" = "en-US";

          # Alfis, I2P, tor TLD's
          "browser.fixup.domainsuffixwhitelist.ygg" = true;
          "browser.fixup.domainsuffixwhitelist.anon" = true;
          "browser.fixup.domainsuffixwhitelist.srv" = true;
          "browser.fixup.domainsuffixwhitelist.mirror" = true;
          "browser.fixup.domainsuffixwhitelist.screen" = true;
          "browser.fixup.domainsuffixwhitelist.merch" = true;
          "browser.fixup.domainsuffixwhitelist.btn" = true;
          "browser.fixup.domainsuffixwhitelist.conf" = true;
          "browser.fixup.domainsuffixwhitelist.index" = true;
          "browser.fixup.domainsuffixwhitelist.mob" = true;
          "browser.fixup.domainsuffixwhitelist.i2p" = true;
          "browser.fixup.domainsuffixwhitelist.onion" = true;

          # Yggdrasil tweaks
          "network.http.fast-fallback-to-IPv4" = false;
          "browser.fixup.fallback-to-https" = false;
          "browser.fixup.alternate.enabled" = false;
          "network.dns.disableIPv6" = false;

          # telemetry
          "devtools.onboarding.telemetry.logged" = false;
          "browser.newtabpage.activity-stream.feeds.telemetry" = false;
          "browser.newtabpage.activity-stream.telemetry" = false;
          "browser.ping-centre.telemetry" = false;
          "toolkit.telemetry.bhrPing.enabled" = false;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.server" = "";
          "toolkit.telemetry.server_owner" = "";
          "toolkit.telemetry.firstShutdownPing.enabled" = false;
          "toolkit.telemetry.hybridContent.enabled" = false;
          "toolkit.telemetry.newProfilePing.enabled" = false;
          "toolkit.telemetry.shutdownPingSender.enabled" = false;
          "toolkit.telemetry.updatePing.enabled" = false;
          "toolkit.telemetry.reportingpolicy.firstRun" = false;
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.archive.enabled" = false;
          "datareporting.healthreport.uploadEnabled" = false;
          "datareporting.policy.dataSubmissionEnabled" = false;
          "datareporting.sessions.current.clean" = true;
        };
        # bookmarks = [
        #   {
        #     name = "wikipedia";
        #     keyword = "wiki";
        #     url = "https://en.wikipedia.org/wiki/Special:Search?search=%s&go=Go";
        #   }
        #   {
        #     name = "Nix sites";
        #     bookmarks = [
        #       {
        #         name = "homepage";
        #         url = "https://nixos.org/";
        #         keyword = "nix";
        #       }
        #       {
        #         name = "wiki";
        #         url = "https://nixos.wiki/";
        #         keyword = "nixwiki";
        #       }
        #       {
        #         name = "search";
        #         url = "https://search.nixos.org/";
        #         keyword = "nixsearch";
        #       }
        #     ];
        #   }
        # ];
      };
    };
  };
}
