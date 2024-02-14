package main

import (
	"fmt"
	"net/http"
	"time"

	"rsc.io/quote"
)

func greet(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello World! %s", time.Now())
}

func main() {
	fmt.Println(quote.Go())
	fmt.Println("Running")
	http.HandleFunc("/", greet)
	http.ListenAndServe(":8080", nil)
}
