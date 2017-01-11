package main

import (
	"html/template"
	"io/ioutil"
	"net/http"
	"os"
	"strings"
)

//go:generate inlinefiles --package=main --vfs=Templates --glob=* ./templates vfs_templates.go

var CustomString = "the Sous Demo App"

func main() {
	host := os.Getenv("TASK_HOST")
	port := os.Getenv("PORT0")
	indexTmplF, err := Templates.Open("index.html.tmpl")
	if err != nil {
		panic(err)
	}

	indexTmplB, err := ioutil.ReadAll(indexTmplF)
	if err != nil {
		panic(err)
	}
	indexTmpl := template.Must(template.New("index").Parse(string(indexTmplB)))

	indexData := struct {
		CustomString string
	}{
		CustomString: CustomString,
	}

	http.HandleFunc("/", func(w http.ResponseWriter, rq *http.Request) {
		indexTmpl.Execute(w, indexData)
	})

	http.ListenAndServe(strings.Join([]string{host, port}, ":"), nil)
}
