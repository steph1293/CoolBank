import requests

url = 'localhost/login'
usernames = ['admin', 'user1', 'user2', 'admin', 'user21']
passwords = ['password1', 'password2', '123456', 'password1', 'password2']

for user in usernames:
    for password in passwords:
        response = requests.post(url, data={'username': user, 'password': password})
        if response.status_code == 200:
            print(f'Successful login: {user} / {password}')
        else:
            print(f'Failed login: {user} / {password}')