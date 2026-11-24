// story: e04s01
package main

import (
	"encoding/json"
	"net/http"
	"os"
)

var buildVersion = "dev"

func main() {
	version := buildVersion
	if data, err := os.ReadFile("VERSION"); err == nil {
		version = string(data)
	}
	http.HandleFunc("/", func(w http.ResponseWriter, _ *http.Request) {
		w.Header().Set("Content-Type", "application/json")
		_ = json.NewEncoder(w).Encode(map[string]string{
			"status":  "ok",
			"version": version,
			"role":    "function",
		})
	})
	_ = http.ListenAndServe(":3000", nil)
}