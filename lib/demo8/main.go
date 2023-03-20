package main

import (
	"fmt"
	"net"
	"time"
)

const (
	PORT = "3000"
)

func main() {
	listener, err := net.Listen("tcp", ":"+PORT)
	if err != nil {
		fmt.Println("Failed to listen on port ", PORT, ", error: ", err)
		return
	}

	defer listener.Close()
	fmt.Println("TCP Server is listening on port ", PORT)

	for {
		conn, err := listener.Accept()
		if err != nil {
			fmt.Println("Error accepting connection: ", err)
			continue
		}

		fmt.Println("Incoming connection from ", conn.RemoteAddr().String())

		go func(c net.Conn) {
			index := 0
			for {
				_, err := c.Write([]byte(fmt.Sprintf("Hello from server, index: %d", index)))
				index++
				time.Sleep(2 * time.Second)
				if err != nil {
					fmt.Println("Error writing data: ", err)
					return
				}
			}
		}(conn)
	}
}
