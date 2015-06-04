```
rake assets:precompile RAILS_ENV=production
rake secret
vim config/secrets.yml
sudo /home/admin/server/nginx/sbin/nginx -s reload
````