#!/bin/bash

# Test script for Quant Expense Tracker
# This script helps you test different months and years

echo "Quant Expense Tracker - Test Mode Setup"
echo "======================================"
echo ""

# Function to start the app in test mode
start_test_mode() {
    local month=$1
    local year=$2
    
    echo "Starting app in test mode..."
    echo "Simulating: Month $month, Year $year"
    echo ""
    
    # Set environment variables for test mode
    export VITE_TEST_MONTH=$month
    export VITE_TEST_YEAR=$year
    
    # Start the development server
    npm run dev
}

# Function to show available options
show_options() {
    echo "Available test scenarios:"
    echo "1. November 2024 (current month simulation)"
    echo "2. December 2024 (next month)"
    echo "3. January 2025 (new year)"
    echo "4. Custom month/year"
    echo "5. Exit"
    echo ""
}

# Main menu
while true; do
    show_options
    read -p "Choose an option (1-5): " choice
    
    case $choice in
        1)
            start_test_mode 11 2024
            break
            ;;
        2)
            start_test_mode 12 2024
            break
            ;;
        3)
            start_test_mode 1 2025
            break
            ;;
        4)
            read -p "Enter month (1-12): " month
            read -p "Enter year (e.g., 2024): " year
            if [[ $month -ge 1 && $month -le 12 && $year -ge 2020 && $year -le 2030 ]]; then
                start_test_mode $month $year
                break
            else
                echo "Invalid month or year. Please try again."
                echo ""
            fi
            ;;
        5)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please choose 1-5."
            echo ""
            ;;
    esac
done
