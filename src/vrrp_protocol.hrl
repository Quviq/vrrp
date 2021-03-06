%%%-------------------------------------------------------------------
%%% @author Rick  Payne <rickp@otolonetworks.com>
%%% @copyright (C) 2017, Otolo Networks, Inc.
%%% @doc
%%%
%%% @end
%%% Created : 25 Jul 2017 by Rick  Payne <rickp@otolonetworks.com>
%%%-------------------------------------------------------------------

-define(VRRP_PROTOCOL, 112).
-define(VRRP_PRIORITY_DEFAULT, 100).         %% RFC 5798 5.2.4
-define(VRRP_ADVERT_INTERVAL_DEFAULT, 100).  %% RFC 5798 5.2.7
-define(VRRP_LEN, 8).
-define(VRRP_V4_MCAST_BIN, <<224,0,0,18>>).
-define(VRRP_V4_MCAST, {224,0,0,18}).
-define(VRRP_TTL, 255).


-type vrrp_version() :: unknown | 3.
-type vrrp_type() :: unknown | announce.
-type vrrp_id() :: 1..255.
-type vrrp_priority() :: 0..254.

-record(vrrp_packet,
        {
          from,                                                 %% Sender...
          version = 3 :: vrrp_version(),                        %% 4 bits
          type = announce :: vrrp_type(),                       %% 4 bits
          id :: vrrp_id(),                                      %% 8 bits
          priority = ?VRRP_PRIORITY_DEFAULT :: vrrp_priority(), %% 8 bits
          interval,                                             %% 12 bits
          ips = []
        }).
