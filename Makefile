task1:
	cd Task/Task1; bash main.sh

task2:
	cd Task/Task2; bash main.sh

task3:
	cd Task/Task3; bash main.sh

task4:
	cd Task/Task4; bash main.sh

task5:
	cd Task/Task5; bash main.sh

task6:
	cd Task/Task6; bash main.sh
clean:
	rm -rf 	demoCA \
		 	ca.crt \
			ca.crt.txt \
			ca.key \
			ca.key.txt \
			server.csr \
			server.csr.txt \
			server.key \
			server.key.txt \
			server.crt \
			server.crt.txt \
			server.pem \
