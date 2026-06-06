package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello, Jenkins and Docker!")
	})
	fmt.Println("Server starting on port 8083...")
	http.ListenAndServe(":8083", nil)
}
