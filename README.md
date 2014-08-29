tribunal
========

The source code for onoratainstanta.ro a project that aims at increasing transparency in the Romanian justice system

Don't be silly, don't install this app manually, use Docker!
```
git clone https://github.com/andreicristianpetcu/tribunal.git
cd tribunal
docker build -t tribunal .
docker run -d -p 80:80 -p 27019:27017 tribunal /sbin/my_init --enable-insecure-key 
