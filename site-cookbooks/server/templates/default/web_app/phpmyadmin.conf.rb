<VirtualHost *:80>
    ServerName <%= @server_name %>
    ServerAlias <% @server_aliases.each do |a| %><%= a %> <% end %>

    DocumentRoot <%= @docroot %>
    RewriteEngine On

    <Directory <%= @docroot %>>
      Options FollowSymLinks
      DirectoryIndex index.php

      <IfModule mod_php5.c>
          AddType application/x-httpd-php .php

          php_flag magic_quotes_gpc Off
          php_flag track_vars On
          php_flag register_globals Off
          php_admin_flag allow_url_fopen Off
          php_value include_path .
          php_admin_value upload_tmp_dir <%= @upload_dir %>
          php_admin_value open_basedir <%= @docroot %>:/etc/phpmyadmin/:/var/lib/phpmyadmin/:/usr/share/php/php-gettext
      </IfModule>

  </Directory>

  # Authorize for setup
  <Directory <%= @docroot %>/setup>
  <IfModule mod_authn_file.c>
      AuthType Basic
  AuthName "phpMyAdmin Setup"
  AuthUserFile /etc/phpmyadmin/htpasswd.setup

  </IfModule>
      Require valid-user
  </Directory>

  # Disallow web access to directories that don't need it
  <Directory <%= @docroot %>/libraries>
      Order Deny,Allow
      Deny from All
  </Directory>

  <Directory <%= @docroot %>/setup/lib>
      Order Deny,Allow
      Deny from All
  </Directory>

</VirtualHost>