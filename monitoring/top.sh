#!/bin/bash

pid=$(ssh -i '/Users/Oscar_Lopez/Downloads/test.pem' ubuntu@3.87.206.83 pidof java)
ssh -i '/Users/Oscar_Lopez/Downloads/test.pem' ubuntu@3.87.206.83 ps -p ${pid} -o %cpu,%mem,cmd
