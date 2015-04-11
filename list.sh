#!/bin/bash

ls ../plots | sed -e "s/\_/\", \"/g" | sed -e "s/\.pdf/\" ],/g" | sed -e "s/^/[ \"/" | column -t
