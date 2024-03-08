#!/bin/bash

pid=$(ssh -i '/Users/Oscar_Lopez/Downloads/test.pem' ubuntu@44.212.43.186 pidof java)
ssh -i '/Users/Oscar_Lopez/Downloads/test.pem' ubuntu@44.212.43.186 ps -p ${pid} -o %cpu,%mem,cmd