1. Run the container image
   docker run -d infracloudio/csvserver:latest

2. Check contianer failure reason
   docker ps -a
   docker logs continer-id
   docker rm container-id

3. Create shell script for generating comma separated values with index and random number
   vi gencsv.sh
   #!/usr/bin/bash
   for i in `seq 10`
   do
   	echo $((i-1)), $RANDOM >> inputFile
   done
   chmod +x gencsv.sh
  ./gencsv.sh
   cat inputFile

4. Run the container again with volume mapping of inputFile
   docker run -d -v /csvserver/solution/inputFile:/csvserver/inputdata infracloudio/csvserver:latest

5. Get shell access of container and find out the port in use.
   docker exec -it container-id bash
   netstat -lntup
   docker stop container-id
   docker rm container-id

6. Run the container again with host port and env variable
   docker run -d -p 9393:9300 -e CSVSERVER_BORDER=Orange -v /csvserver/solution/inputFile:/csvserver/inputdata infracloudio/csvserver:latest
   http://localhost:9393
Access the application on http://localhost:9393 which contains 10 entries of random number with index and Orange border of Welcome note.
