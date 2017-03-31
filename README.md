# sesam-config-sync-tools
Tools to synchronize config between a Sesam Instance and local file system

## Installation

1. Clone the Git repo to a local folder
2. Create symlinks on your path to the scripts you just cloned
3. Start syncing your Sesam config with your local file system

       $ git clone -q https://github.com/sesam-io/sesam-config-sync-tools ~/sesam-config-sync-tools
       $ ln -s ~/sesam-config-sync-tools/*.sh ~/bin

## Configure

Copy the syncconfig-template to .syncconfig in the directory you want to sync your config and update the file with your values.

       $ cp ~/sesam-config-sync-tools/syncconfig-template .syncconfig

## Usage

    $ status.sh 
    diff -r node/node-metadata.conf.json local/node-metadata.conf.json
    4c4
    <   "namespaced_identifiers": false,
    ---
    >   "namespaced_identifiers": true,
    Node config is NOT in sync with local config.

    $ upload.sh 
    Node config replaced with local config.

    $ status.sh 
    Node config is up-to-date with local config.
    
    ## (you add something to the node)
    
    $ status.sh 
    Only in node/pipes: my-pipe.conf.json
    Node config is NOT in sync with local config.
    
    $ download.sh 
    Local config replaced by node config.
    
    $ status.sh 
    Node config is up-to-date with local config.
