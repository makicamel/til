## 生SQLをどうしても実行したい時

```ruby
con = ActiveRecord::Base.connection
sql = 'SELECT name, email FROM users'
result = con.select_all(sql)
result.to_hash
```
