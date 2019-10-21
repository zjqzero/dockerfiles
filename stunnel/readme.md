## 部署
- 参考compose.yml


## 生成证书

    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout key.pem -out key.pem

## 得到CApath使用hash证书

    hash_name=`openssl x509 -hash -noout -in ${FILE_NAME}.pem `  
    mv ${FILE_NAME}.pem $hash_name.0 

    最终得到证书xxxxxxx.0