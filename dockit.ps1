# Parse the arguments of the script
if (($Args[0] -eq "create") -or ($Args[0] -eq "-c")) {
    Write-Host "Creating container..."
    docker run -it -d --name="$($Args[1])" -v "$($env:userprofile):/root" fedora /bin/bash
    Write-Host "Container created!"
}

elseif (($Args[0] -eq "enter") -or ($Args[0] -eq "-e")) {
    Write-Host "Entering container..."
    docker start $Args[1]
    docker exec -it $Args[1] /bin/bash
}

elseif (($Args[0] -eq "stop") -or ($Args[0] -eq "-s")) {
    Write-Host "Stopping container..."
    docker stop $Args[1]
    Write-Host "Container successfully stopped!"
}

elseif (($Args[0] -eq "restart") -or ($Args[0] -eq "-r")) {
    Write-Host "Stopping container..."
    docker stop $Args[1]
    Write-Host "Container successfully stopped. Starting container..."
    docker start $Args[1]
    Write-Host "Container successfully restarted!"
}

elseif (($Args[0] -eq "remove") -or ($Args[0] -eq "-rm")) {
    Write-Host "Stopping container..."
    docker stop $Args[1]
    Write-Host "Container stopped. Deleting container..."
    docker container rm $Args[1]
    Write-Host "Container succesfully deleted!"
}

elseif (($Args[0] -eq "list") -or ($Args[0] -eq "-l")) {
    docker container list -a
}

else {
    Write-Host "Help text will be coming soon!"
}