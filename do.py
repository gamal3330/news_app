import argparse
import random
import requests
import threading
import time

# تعريف المتغيرات العامة
url = ""
payload = ""
threads = 0
request_counter = 0
printed_msgs = []
wait_group = threading.Semaphore()

# تعريف الدوال
def print_msg(msg):
    global printed_msgs
    global request_counter
    if msg not in printed_msgs:
        print(f"\n{msg} after {request_counter} requests")
        printed_msgs.append(msg)

def contains(slice, item):
    return item in slice

# تعريف الوظائف الأساسية
def main():
    global url
    global payload
    global threads
    global request_counter
    global wait_group

    # تحليل الأوامر
    parser = argparse.ArgumentParser()
    parser.add_argument("--url", help="URL to send requests to", required=True)
    parser.add_argument("--payload", help="Payload to send with the request")
    parser.add_argument("--threads", help="Number of threads to use", type=int, default=1)
    args = parser.parse_args()

    url = args.url
    payload = args.payload
    threads = args.threads

    # إعداد الخيوط
    for _ in range(threads):
        thread = threading.Thread(target=send_request)
        thread.start()

def send_request():
    global request_counter
    global wait_group
    while True:
        # إرسال الطلب
        response = requests.post(url, data=payload)
        request_counter += 1
        # طباعة الرسالة إذا كانت الاستجابة ناجحة
        if response.status_code == 200:
            print_msg("Received 200 OK")

        # الانتظار لمدة عشوائية
        time.sleep(random.uniform(0.1, 2))

if __name__ == "__main__":
    main()
