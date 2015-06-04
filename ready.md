# 已经支持的数据


## 1、普通的hash
```ruby
"{\"baidu\"=>{\"provider\"=>\"baidu\", \"uid\"=>\"1677930031\", \"info\"=>{\"user_name\"=>\"ttt\", \"uid\"=>\"1677432323\", \"is_app_user\"=>\"1\", \"name\"=>nil}, \"credentials\"=>{\"token\"=>\"214.42393718b409c614f337091e5580fc0e.2592000.1417269154.1677930031-764874\", \"refresh_token\"=>\"23.0a473d14f072756f007e7589251949c4.315360000.1730037154.1677930031-764874\", \"expires_at\"=>1417269154, \"expires\"=>true}, \"extra\"=>{}}}"
```

## 2、一个普通的json
```
{"FILE_TYPE":"TXT"}
```

## 3、一个转译的json（不美观）
```
{\"REPORT_DATE\":201410,\"FILE_TYPE\":\"TXT\"}
```

## 4、一个symbol的hash
```
"{:agentId=>nil, :Type=>\"0\"}"
```
