#!/bin/bash
echo ""
figlet Container Security
echo ""
echo ""
echo "1.Trivy (Image Scanning)"
echo "2.Dive"
echo "3.Inspec"
echo "4.Grype"
echo "5.Syft"
echo "6.Docker Bench Security"
echo "7.Trivy (TAR file Scanning)"
echo "8.Falco"
echo "9.JFrog Xray"
echo "10.Exit"
echo ""
echo "Enter a Tool (option) Number"

read option
if [ $option -ne 10 ]
then
	if [ $option -eq 1 ]
	then
		echo ""
		echo ""
		echo "Scanning Image using Trivy" 
		echo ""
		echo ""
		docker images
		echo ""
		echo "Enter Docker image name"
		read img
		trivy image $img
	elif [ $option -eq 2 ]
	then
		echo ""
		echo ""
		echo "Inspect the internals of Docker using Dive"
		echo ""
		echo ""
		docker images
		echo ""
		echo "Enter Docker Image name"
		read img
		dive $img
	elif [ $option -eq 3 ]
	then
		echo ""
		echo ""
		echo "Check for Compliance and Automate using Inspec"
		echo ""
		echo ""
		inspec detect && inspec compliance && inspec automate
		echo ""
	elif [ $option -eq 4 ]
	then
		echo ""
		echo ""
		echo "Scan using Grype"
		echo ""
		echo "Enter the name of the image to be downloaded and scanned"
		read img
		grype $img
	elif [ $option -eq 5 ]
	then
		echo ""
		echo ""
		echo "Scan using Syft"
		echo ""
		echo "Enter the name of the image to be loaded and scanned"
		read img
		syft $img
	elif [ $option -eq 6 ]
	then
		echo ""
		echo ""
		echo "Scan the Host machine using Docker Bench Security"
		cd ../docker-bench-security
		./docker-bench-security.sh
	elif [ $option -eq 7 ]
	then
		echo ""
		echo ""
		echo "Scan the image tar file using Trivy"
		echo ""
		echo "Enter the full path to the .tar file"
		read path
		trivy image --input $path
	elif [ $option -eq 8 ]
	then 
		echo ""
		echo ""
		echo "Monitor events using Falco"
		echo ""
		falco -A
	
	else
	echo "Another option"
	fi
else
	echo "Exiting"
fi
