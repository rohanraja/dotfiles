package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"strings"
)

// Define a struct to match the YAML structure
type Config struct {
	Name       string `yaml:"Name"`
	InitConfig []struct {
		Name    string `yaml:"Name"`
		Command string `yaml:"Command"`
	} `yaml:"InitConfig"`
}

func main() {
	// Example YAML content
	//
	//

	// declare baseDir as current directory unless specified as first argument
	baseDir := "."
	if len(os.Args) > 1 {
		baseDir = os.Args[1]
	}

	ymlFile := fmt.Sprintf("%s/devmate.yml", baseDir)

	// If ymlFile does not exist, then create a new one with the default content
	//
	if _, err := os.Stat(ymlFile); os.IsNotExist(err) {
		defaultYamlContent := `Name: "MyProject"
InitConfig:
  - Name: "nvim"
    Command: "nvim ."
`
		err := ioutil.WriteFile(ymlFile, []byte(defaultYamlContent), 0644)
		if err != nil {
			log.Fatalf("error: %v", err)
		}

		fmt.Println("Created a new devmate.yml file with default content")
	}

	// Append path to ~/.local/projects.txt file if not already present

	// Append path to ~/.local/projects.txt file if not already present
	projectsFile := fmt.Sprintf("%s/.local/projects.txt", os.Getenv("HOME"))

	// If the file does not exist, create it and append the baseDir
	if _, err := os.Stat(projectsFile); os.IsNotExist(err) {
		f, err := os.Create(projectsFile)
		if err != nil {
			log.Fatalf("error: %v", err)
		}
		defer f.Close()
	}

	projects, err := ioutil.ReadFile(projectsFile)
	if err != nil {
		log.Fatalf("error: %v", err)
	}

	// Resolve baseDir to absolute path
	baseDir, err = os.Getwd()
	if err != nil {
		log.Fatalf("error: %v", err)
	}

	if !strings.Contains(string(projects), baseDir) {
		f, err := os.OpenFile(projectsFile, os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
		if err != nil {
			log.Fatalf("error: %v", err)
		}
		defer f.Close()
		if _, err := f.WriteString(baseDir + "\n"); err != nil {
			log.Fatalf("error: %v", err)
		}
	}
}
