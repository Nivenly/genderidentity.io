package main

import (
	"bytes"
	"fmt"
	"log"
	"os/exec"
	"sync"

	"github.com/gobuffalo/envy"
	"github.com/nivenly/genderidentity/actions"
)

func runHugo() {
	// We'll use ping as it will provide output and we can control how long it runs.
	cmd := exec.Command("hugo", "-s", "hugo/", "-d", "../public", "-w")

	// Use a bytes.Buffer to get the output
	var buf bytes.Buffer
	cmd.Stdout = &buf

	cmd.Start()

	// Use a channel to signal completion so we can use a select statement
	done := make(chan error)
	go func() { done <- cmd.Wait() }()

	// The select statement allows us to execute based on which channel
	// we get a message from first.
	select {
	case err := <-done:
		// Command completed before timeout. Print output and error if it exists.
		fmt.Println("Output:", buf.String())
		if err != nil {
			fmt.Println("Non-zero exit code:", err)
		}
	}
}

func main() {
	wg := &sync.WaitGroup{}
	wg.Add(1)
	go runHugo()

	port := envy.Get("PORT", "3000")
	app := actions.App()
	log.Fatal(app.Start(port))

	wg.Wait()
}
