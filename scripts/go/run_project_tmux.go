package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"os/exec"

	"gopkg.in/yaml.v2"
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
	// Parse the YAML into our struct
	config := getProjectConfig()

	// Iterate over each InitConfig and execute the command
	for _, initConf := range config.InitConfig {
		tmuxCommand := fmt.Sprintf("tmux_run_cmd %s %s '%s'", config.Name, initConf.Name, initConf.Command)
		fmt.Println("Executing:", tmuxCommand)

		// Running the command
		cmd := exec.Command("bash", "-c", tmuxCommand)
		output, err := cmd.CombinedOutput()
		if err != nil {
			log.Printf("Error executing %s: %s", tmuxCommand, err)
			continue
		}
		fmt.Printf("Output of %s: %s\n", tmuxCommand, string(output))
	}
}

func getProjectConfig() Config {
	baseDir := "."
	if len(os.Args) > 1 {
		baseDir = os.Args[1]
	}

	ymlFile := fmt.Sprintf("%s/devmate.yml", baseDir)
	yamlContent, err := ioutil.ReadFile(ymlFile)
	if err != nil {
		log.Fatalf("error: %v", err)
	}

	var config Config
	err = yaml.Unmarshal([]byte(yamlContent), &config)
	if err != nil {
		log.Fatalf("error: %v", err)
	}
	return config
}
