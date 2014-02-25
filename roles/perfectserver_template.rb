name "perfectserver_template"

run_list(
    "recipe[perfectserver]"
)


default_attributes({
  :ssl => {
      :cert => "",
      :key  => ""
  }
})


override_attributes({


    #MYSQL
    :mysql => {
        :server_root_password => 'root',
        :server_repl_password => 'root',
        :server_debian_password => 'root',

        :bind_address => '127.0.0.1',

    },




    #APACHE

    :apache => {
        :contact => 'webmaster@example.net',
        :default_site_enabled => TRUE
    },


    #PHP

    :php => {
        :tunable => {
            :max_upload_size => "1G"
        }
    },


    #POSTFIX

    :postfix => {
        :mail_type => 'server',
        :smtp_sasl_auth_enable => 'yes',
        :smtpd_recipient_restrictions => [
            'permit_sasl_authenticated',
            'permit_mynetworks',
            'reject_unlisted_recipient',
            'reject_unknown_recipient_domain',
            'reject_non_fqdn_recipient',
            'reject_unauth_destination',
            'reject_unauth_pipelining',
            'reject_rbl_client combined.njabl.org',
            'reject_rbl_client dul.dnsbl.sorbs.net',
            'reject_rbl_client sbl-xbl.spamhaus.org',
            'reject_rbl_client rhsbl.sorbs.net',
            'reject_rbl_client dnsbl.inps.de',
            'check_policy_service inet:127.0.0.1:2525'
        ]
    },


    #PostfixGLD

    :postfixgld => {
        :mysql => {
            'user' => 'gld',
            'password' => 'gld',
            'db' => 'sysgld'
        },
        'mxgrey' => 5
    },


    #PUREFTPD

    :pureftpd => {
        :ssl_cert => "",
        :ssl_key => ""
    },

    ## Web Applications

    # PhpMyAdmin
    :phpmyadmin => {
        :version => '4.0.0',
        :checksum => '',
        :fpm => false,
        :home => '/var/www/phpmyadmin',
        :upload_dir => '/tmp/phpmyadmin',
        :save_dir => '/tmp/phpmyadmin',
        :maxrows => 1000,
        :blowfish_secret => 'EXHCNAGETHISSTRING',
        :server_aliases => ['phpmyadmin.*.*']
    },


    # RoundCube
    :roundcube => {
        :version => '0.9.0',
        :cehcksum => '',
        :db => {
            :database => 'sysroundcube'
        },
        :server_aliases => ['webmail.*.*'],
        :imap_default_host => 'localhost'
    }
})
