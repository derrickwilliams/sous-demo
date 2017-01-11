package main

import (
	"html/template"
	"io/ioutil"
	"log"
	"net/http"
	"os"
	"strings"
)

//go:generate inlinefiles --package=main --vfs=Templates --glob=* ./templates vfs_templates.go

var CustomString = "the Sous Demo App"

func main() {
	log.SetFlags(log.Flags() | log.Lshortfile | log.Ltime)
	log.Print("Booting...")
	host := os.Getenv("TASK_HOST")
	port := os.Getenv("PORT0")
	indexTmplF, err := Templates.Open("index.html.tmpl")
	if err != nil {
		log.Fatal(err)
	}

	indexTmplB, err := ioutil.ReadAll(indexTmplF)
	if err != nil {
		log.Fatal(err)
	}
	indexTmpl := template.Must(template.New("index").Parse(string(indexTmplB)))

	indexData := struct {
		CustomString string
	}{
		CustomString: CustomString,
	}

	http.HandleFunc("/", func(w http.ResponseWriter, rq *http.Request) {
		log.Printf("Handling request: %v", rq)
		indexTmpl.Execute(w, indexData)
	})

	log.Printf("Starting up - serving on %s:%s", host, port)
	log.Fatal(http.ListenAndServe(":"+port, nil))
}
