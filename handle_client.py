import socket
import threading

# Store messages from clients
messages = []

def handle_client(client_socket, client_name):
    while True:
        message = client_socket.recv(1024)
        if not message:
            break
        decoded_message = message.decode()
        messages.append((client_name, decoded_message))  # Store the message
        print(f"Received from {client_name}: {decoded_message}")

        # Forward the message to the other client
        other_client_name = "Client1" if client_name == "Client2" else "Client2"
        for client in clients:
            if client != client_socket:
                client.send(f"{other_client_name}: {decoded_message}".encode())

    client_socket.close()
    print(f"Connection with {client_name} closed.")

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind(('0.0.0.0', 8080))  # Use a different port for the server
server.listen(2)  # Allow up to 2 clients to connect

print("Server is listening for connections...")

clients = []

while len(clients) < 2:
    client, addr = server.accept()
    client_name = f"Client{len(clients) + 1}"
    print(f"Accepted connection from {addr[0]}:{addr[1]} as {client_name}")
    clients.append(client)
    client_handler = threading.Thread(target=handle_client, args=(client, client_name))
    client_handler.start()
