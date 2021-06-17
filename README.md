* Student Name:
Abrar Al-Sagheer
S3707180

* ApiKey for quizapi.io
2344cadd32efcef04e7cde82f8f12c84

* Heroku deployment URL
https://radassign.herokuapp.com/

* Heroku deployment log

vocstartsoft:~/environment/assign2 (main) $ git push
Enumerating objects: 19, done.
Counting objects: 100% (19/19), done.
Compressing objects: 100% (11/11), done.
Writing objects: 100% (11/11), 1.38 KiB | 469.00 KiB/s, done.
Total 11 (delta 6), reused 0 (delta 0), pack-reused 0
remote: Compressing source files... done.
remote: Building source:
remote: 
remote: -----> Building on the Heroku-20 stack
remote: -----> Using buildpack: heroku/ruby
remote: -----> Ruby app detected
remote: -----> Installing bundler 2.2.16
remote: -----> Removing BUNDLED WITH version in the Gemfile.lock
remote: -----> Compiling Ruby/Rails
remote: -----> Using Ruby version: ruby-2.7.2
remote: -----> Installing dependencies using bundler 2.2.16
remote:        Running: BUNDLE_WITHOUT='development:test' BUNDLE_PATH=vendor/bundle BUNDLE_BIN=vendor/bundle/bin BUNDLE_DEPLOYMENT=1 bundle install -j4
remote:        Using rake 13.0.3
remote:        Using concurrent-ruby 1.1.9
remote:        Using i18n 1.8.10
remote:        Using minitest 5.14.4
remote:        Using tzinfo 2.0.4
remote:        Using zeitwerk 2.4.2
remote:        Using activesupport 6.1.3.2
remote:        Using builder 3.2.4
remote:        Using erubi 1.10.0
remote:        Using racc 1.5.2
remote:        Using nokogiri 1.11.7 (x86_64-linux)
remote:        Using rails-dom-testing 2.0.3
remote:        Using crass 1.0.6
remote:        Using loofah 2.10.0
remote:        Using rails-html-sanitizer 1.3.0
remote:        Using actionview 6.1.3.2
remote:        Using rack 2.2.3
remote:        Using rack-test 1.1.0
remote:        Using actionpack 6.1.3.2
remote:        Using nio4r 2.5.7
remote:        Using websocket-extensions 0.1.5
remote:        Using websocket-driver 0.7.5
remote:        Using actioncable 6.1.3.2
remote:        Using globalid 0.4.2
remote:        Using activejob 6.1.3.2
remote:        Using activemodel 6.1.3.2
remote:        Using activerecord 6.1.3.2
remote:        Using marcel 1.0.1
remote:        Using mini_mime 1.0.3
remote:        Using activestorage 6.1.3.2
remote:        Using mail 2.7.1
remote:        Using actionmailbox 6.1.3.2
remote:        Using actionmailer 6.1.3.2
remote:        Using actiontext 6.1.3.2
remote:        Using msgpack 1.4.2
remote:        Using bootsnap 1.7.5
remote:        Using bundler 2.2.16
remote:        Using unf_ext 0.0.7.7
remote:        Using unf 0.1.4
remote:        Using domain_name 0.5.20190701
remote:        Using ffi 1.15.3
remote:        Using http-accept 1.7.0
remote:        Using http-cookie 1.0.4
remote:        Using jbuilder 2.11.2
remote:        Using method_source 1.0.0
remote:        Using mime-types-data 3.2021.0225
remote:        Using mime-types 3.3.1
remote:        Using netrc 0.11.0
remote:        Using pg 1.2.3
remote:        Using puma 5.3.2
remote:        Using rack-proxy 0.7.0
remote:        Using thor 1.1.0
remote:        Using railties 6.1.3.2
remote:        Using sprockets 4.0.2
remote:        Using sprockets-rails 3.2.2
remote:        Using rails 6.1.3.2
remote:        Using rest-client 2.1.0
remote:        Using sassc 2.4.0
remote:        Using tilt 2.0.10
remote:        Using sassc-rails 2.1.2
remote:        Using sass-rails 6.0.0
remote:        Using semantic_range 3.0.0
remote:        Using turbolinks-source 5.2.0
remote:        Using turbolinks 5.2.1
remote:        Using webpacker 5.4.0
remote:        Bundle complete! 17 Gemfile dependencies, 65 gems now installed.
remote:        Gems in the groups 'development' and 'test' were not installed.
remote:        Bundled gems are installed into `./vendor/bundle`
remote:        Bundle completed (0.48s)
remote:        Cleaning up the bundler cache.
remote: -----> Installing node-v12.16.2-linux-x64
remote: -----> Installing yarn-v1.22.4
remote: -----> Detecting rake tasks
remote: -----> Preparing app for Rails asset pipeline
remote:        Running: rake assets:precompile
remote:        yarn install v1.22.4
remote:        [1/4] Resolving packages...
remote:        [2/4] Fetching packages...
remote:        info fsevents@2.3.2: The platform "linux" is incompatible with this module.
remote:        info "fsevents@2.3.2" is an optional dependency and failed compatibility check. Excluding it from installation.
remote:        info fsevents@1.2.13: The platform "linux" is incompatible with this module.
remote:        info "fsevents@1.2.13" is an optional dependency and failed compatibility check. Excluding it from installation.
remote:        [3/4] Linking dependencies...
remote:        [4/4] Building fresh packages...
remote:        Done in 22.82s.
remote:        Compiling...
remote:        Compiled all packs in /tmp/build_0c89d571/public/packs
remote:        Though the "loose" option was set to "false" in your @babel/preset-env config, it will not be used for @babel/plugin-proposal-private-methods since the "loose" mode option was set to "true" for @babel/plugin-proposal-class-properties.
remote:        The "loose" option must be the same for @babel/plugin-proposal-class-properties, @babel/plugin-proposal-private-methods and @babel/plugin-proposal-private-property-in-object (when they are enabled): you can silence this warning by explicitly adding
remote:         ["@babel/plugin-proposal-private-methods", { "loose": true }]
remote:        to the "plugins" section of your Babel config.
remote:        Though the "loose" option was set to "false" in your @babel/preset-env config, it will not be used for @babel/plugin-proposal-private-methods since the "loose" mode option was set to "true" for @babel/plugin-proposal-class-properties.
remote:        The "loose" option must be the same for @babel/plugin-proposal-class-properties, @babel/plugin-proposal-private-methods and @babel/plugin-proposal-private-property-in-object (when they are enabled): you can silence this warning by explicitly adding
remote:         ["@babel/plugin-proposal-private-methods", { "loose": true }]
remote:        to the "plugins" section of your Babel config.
remote:        Though the "loose" option was set to "false" in your @babel/preset-env config, it will not be used for @babel/plugin-proposal-private-methods since the "loose" mode option was set to "true" for @babel/plugin-proposal-class-properties.
remote:        The "loose" option must be the same for @babel/plugin-proposal-class-properties, @babel/plugin-proposal-private-methods and @babel/plugin-proposal-private-property-in-object (when they are enabled): you can silence this warning by explicitly adding
remote:         ["@babel/plugin-proposal-private-methods", { "loose": true }]
remote:        to the "plugins" section of your Babel config.
remote:        Though the "loose" option was set to "false" in your @babel/preset-env config, it will not be used for @babel/plugin-proposal-private-methods since the "loose" mode option was set to "true" for @babel/plugin-proposal-class-properties.
remote:        The "loose" option must be the same for @babel/plugin-proposal-class-properties, @babel/plugin-proposal-private-methods and @babel/plugin-proposal-private-property-in-object (when they are enabled): you can silence this warning by explicitly adding
remote:         ["@babel/plugin-proposal-private-methods", { "loose": true }]
remote:        to the "plugins" section of your Babel config.
remote:        Though the "loose" option was set to "false" in your @babel/preset-env config, it will not be used for @babel/plugin-proposal-private-methods since the "loose" mode option was set to "true" for @babel/plugin-proposal-class-properties.
remote:        The "loose" option must be the same for @babel/plugin-proposal-class-properties, @babel/plugin-proposal-private-methods and @babel/plugin-proposal-private-property-in-object (when they are enabled): you can silence this warning by explicitly adding
remote:         ["@babel/plugin-proposal-private-methods", { "loose": true }]
remote:        to the "plugins" section of your Babel config.
remote:        Though the "loose" option was set to "false" in your @babel/preset-env config, it will not be used for @babel/plugin-proposal-private-methods since the "loose" mode option was set to "true" for @babel/plugin-proposal-class-properties.
remote:        The "loose" option must be the same for @babel/plugin-proposal-class-properties, @babel/plugin-proposal-private-methods and @babel/plugin-proposal-private-property-in-object (when they are enabled): you can silence this warning by explicitly adding
remote:         ["@babel/plugin-proposal-private-methods", { "loose": true }]
remote:        to the "plugins" section of your Babel config.
remote:        
remote:        Hash: 0613a9b3364c08fc0d50
remote:        Version: webpack 4.46.0
remote:        Time: 5858ms
remote:        Built at: 06/17/2021 1:30:32 PM
remote:                                                Asset       Size  Chunks                         Chunk Names
remote:               js/application-12f04455053704825e8e.js   69.3 KiB       0  [emitted] [immutable]  application
remote:            js/application-12f04455053704825e8e.js.br   15.4 KiB          [emitted]              
remote:            js/application-12f04455053704825e8e.js.gz   17.8 KiB          [emitted]              
remote:           js/application-12f04455053704825e8e.js.map    205 KiB       0  [emitted] [dev]        application
remote:        js/application-12f04455053704825e8e.js.map.br   43.8 KiB          [emitted]              
remote:        js/application-12f04455053704825e8e.js.map.gz   50.9 KiB          [emitted]              
remote:                                        manifest.json  364 bytes          [emitted]              
remote:                                     manifest.json.br  132 bytes          [emitted]              
remote:                                     manifest.json.gz  142 bytes          [emitted]              
remote:        Entrypoint application = js/application-12f04455053704825e8e.js js/application-12f04455053704825e8e.js.map
remote:        [0] (webpack)/buildin/module.js 552 bytes {0} [built]
remote:        [4] ./app/javascript/packs/application.js 480 bytes {0} [built]
remote:        [5] ./app/javascript/channels/index.js 205 bytes {0} [built]
remote:        [6] ./app/javascript/channels sync _channel\.js$ 160 bytes {0} [built]
remote:            + 3 hidden modules
remote:        
remote:        Asset precompilation completed (33.43s)
remote:        Cleaning assets
remote:        Running: rake assets:clean
remote: -----> Detecting rails configuration
remote: 
remote: ###### WARNING:
remote: 
remote:        There is a more recent Ruby version available for you to use:
remote:        
remote:        2.7.3
remote:        
remote:        The latest version will include security and bug fixes. We always recommend
remote:        running the latest version of your minor release.
remote:        
remote:        Please upgrade your Ruby version.
remote:        
remote:        For all available Ruby versions see:
remote:          https://devcenter.heroku.com/articles/ruby-support#supported-runtimes
remote: 
remote: ###### WARNING:
remote: 
remote:        No Procfile detected, using the default web server.
remote:        We recommend explicitly declaring how to boot your server process via a Procfile.
remote:        https://devcenter.heroku.com/articles/ruby-default-web-server
remote: 
remote: 
remote: -----> Discovering process types
remote:        Procfile declares types     -> (none)
remote:        Default types for buildpack -> console, rake, web
remote: 
remote: -----> Compressing...
remote:        Done: 92M
remote: -----> Launching...
remote:        Released v28
remote:        https://radassign.herokuapp.com/ deployed to Heroku
remote: 
remote: Verifying deploy... done.
To https://git.heroku.com/radassign.git
   945a3e5..563b1cb  main -> main