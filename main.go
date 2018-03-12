package main

import (
	"fmt"
	"log"
	"net/http"
)

const (
	port = 8080
)

var (
	version  string
	revision string
)

func main() {
	m := http.NewServeMux()

	m.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintln(w, "hello")
		log.Println("/")
	})

	m.HandleFunc("/version", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Version: %s, Revision: %s\n", version, revision)
		log.Println("/version")
	})

	log.Printf("server stated at localhost:%d", port)

	if err := http.ListenAndServe(fmt.Sprintf(":%d", port), m); err != nil {
		log.Fatal(err)
	}
}
