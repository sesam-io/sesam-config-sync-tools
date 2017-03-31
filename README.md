# sesam-config-sync-tools
Tools to synchronize config between a Sesam Instance and local file system

## Set-up

Copy the config-template to .syncconfig and update the file your values.

## Usage

    $ ./status.sh 
    diff -r node/node-metadata.conf.json local/node-metadata.conf.json
    4c4
    <   "namespaced_identifiers": false,
    ---
    >   "namespaced_identifiers": true,
    Node config is NOT in sync with local config.

    $ ./upload.sh 
    Node config replaced with local config.

    $ ./status.sh 
    Node config is up-to-date with local config.
    
    ## (you add something to the node)
    
    $ ./status.sh 
    Only in node/pipes: my-pipe.conf.json
    Node config is NOT in sync with local config.
    
    $ ./download.sh 
    Local config replaced by node config.
    
    $ ./status.sh 
    Node config is up-to-date with local config.
