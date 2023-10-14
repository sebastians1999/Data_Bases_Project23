import socket
import threading

def send_message(client_socket):
    while True:
        message = input("Client2: ")
        client_socket.send(message.encode())

def receive_messages(client_socket):
    while True:
        message = client_socket.recv(1024)
        print(f"Received: {message.decode()}")

client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.connect(('127.0.0.1', 8080))  # Connect to the server on the same machine, using the same server port

send_thread = threading.Thread(target=send_message, args=(client,))
receive_thread = threading.Thread(target=receive_messages, args=(client,))

send_thread.start()
receive_thread.start()
