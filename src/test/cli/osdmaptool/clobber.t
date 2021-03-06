  $ osdmaptool --createsimple 3 myosdmap
  osdmaptool: osdmap file 'myosdmap'
  osdmaptool: writing epoch 1 to myosdmap

  $ ORIG_FSID="$(osdmaptool --print myosdmap|grep ^fsid)"
  osdmaptool: osdmap file 'myosdmap'

  $ osdmaptool --createsimple 3 myosdmap
  osdmaptool: osdmap file 'myosdmap'
  osdmaptool: myosdmap exists, --clobber to overwrite
  [255]

# hasn't changed yet
#TODO typo
  $ osdmaptool --print myosdmap
  osdmaptool: osdmap file 'myosdmap'
  epoch 1
  fsid [0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12} (re)
  created \d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\.\d+ (re)
  modified \d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\.\d+ (re)
  flags 
  crush_version 1
  full_ratio 0
  backfillfull_ratio 0
  nearfull_ratio 0
  min_compat_client jewel
  
  pool 0 'rbd' replicated size 3 min_size 2 crush_ruleset 0 object_hash rjenkins pg_num 192 pgp_num 192 last_change 0 flags hashpspool stripe_width 0
  
  max_osd 3
  

  $ NEW_FSID="$(osdmaptool --print myosdmap|grep ^fsid)"
  osdmaptool: osdmap file 'myosdmap'
  $ [ "$ORIG_FSID" = "$NEW_FSID" ]

  $ osdmaptool --createsimple 1 --clobber myosdmap
  osdmaptool: osdmap file 'myosdmap'
  osdmaptool: writing epoch 1 to myosdmap

  $ osdmaptool --print myosdmap
  osdmaptool: osdmap file 'myosdmap'
  epoch 1
  fsid [0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12} (re)
  created \d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\.\d+ (re)
  modified \d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\.\d+ (re)
  flags 
  crush_version 1
  full_ratio 0
  backfillfull_ratio 0
  nearfull_ratio 0
  min_compat_client jewel
  
  pool 0 'rbd' replicated size 3 min_size 2 crush_ruleset 0 object_hash rjenkins pg_num 64 pgp_num 64 last_change 0 flags hashpspool stripe_width 0
  
  max_osd 1
  

  $ NEW_FSID="$(osdmaptool --print myosdmap|grep ^fsid)"
  osdmaptool: osdmap file 'myosdmap'
#TODO --clobber should probably set new fsid, remove the [1]
  $ [ "$ORIG_FSID" != "$NEW_FSID" ]
  [1]
