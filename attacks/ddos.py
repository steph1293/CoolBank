import requests
import threading

def send_requests(url, num_requests):
    for _ in range(num_requests):
        requests.get(url)

url = 'localhost'
num_threads = 100

for _ in range(num_threads):
    thread = threading.Thread(target=send_requests, args=(url, 1000))
    thread.start()