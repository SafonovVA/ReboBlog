#[ReboBlog](https://reboblog.herokuapp.com)

##Docker steps
```bash
$ sudo docker login
$ sudo docker build -t reboblog .
$ sudo docker run -d -p 8080:80 --name abc reboblog
$ docker rm --force abc
```
##Heroku steps
```bash
$ heroku login
$ sudo heroku container:push -a reboblog web
$ sudo heroku container:release -a reboblog web
$ sudo heroku container:rm -a reboblog web
$ sudo heroku container:rm -a reboblog web
$ sudo heroku logs --tail -a reboblog
```
