# Called during every load — only writes defaults if channels don't exist yet.
# This preserves any runtime customisations made via the channel API.
# To reset to file defaults: function macro:tick/reset_channels
execute unless data storage macro:engine tick.channels run function macro:tick/config