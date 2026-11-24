// story: e04s01
package main

import (
	"encoding/json"
	"fmt"
	"net/http"
	"os"
)

var buildVersion = "dev"

func readVersion() string {
	if data, err := os.ReadFile("VERSION"); err == nil {
		return string(data)
	}
	return buildVersion
}

func main() {
	http.HandleFunc("/health", func(w http.ResponseWriter, _ *http.Request) {
		w.Header().Set("Content-Type", "application/json")
		_ = json.NewEncoder(w).Encode(map[string]string{
			"status":  "ok",
			"version": readVersion(),
		})
	})
	http.HandleFunc("/", func(w http.ResponseWriter, _ *http.Request) {
		_, _ = fmt.Fprintf(w, `<!doctype html><html><body><h1>Go canary</h1><footer>v%s</footer></body></html>`, readVersion())
	})
	_ = http.ListenAndServe(":8080", nil)
}