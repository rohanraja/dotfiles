package main

import (
	"bytes"
	"fmt"
	"os"
	"os/exec"
	"strconv"
	"strings"
)

func main() {
	// Replace this with the string you are searching for in the process command name
	searchString := os.Args[1]

	// Execute the 'ps' command to get a list of all processes with their RSS memory usage in kilobytes
	// The command 'ps aux' is used to list all running processes
	// The output is filtered to include only the process command and RSS (Resident Set Size)
	cmd := exec.Command("bash", "-c", "ps aux | awk '{print $11, $6}'")
	var out bytes.Buffer
	cmd.Stdout = &out
	err := cmd.Run()
	if err != nil {
		fmt.Println("Failed to execute command:", err)
		return
	}

	// Split the output into lines
	lines := strings.Split(out.String(), "\n")

	totalMemoryKB := 0
	for _, line := range lines {
		// Split each line into its components (command and RSS memory usage in kilobytes)
		parts := strings.Fields(line)
		if len(parts) >= 2 {
			command := parts[0]
			memoryUsageKB, err := strconv.Atoi(parts[1])
			if err != nil {
				fmt.Println("Error parsing memory usage:", err)
				continue
			}

			// Check if the command contains the search string
			if strings.Contains(command, searchString) {
				// Add the memory usage in kilobytes to the total
				totalMemoryKB += memoryUsageKB
			}
		}
	}

	// Convert total memory usage from kilobytes to megabytes
	totalMemoryMB := float64(totalMemoryKB) / 1024.0

	fmt.Printf("Total memory usage of processes containing '%s': %.2f MB\n", searchString, totalMemoryMB)
}
