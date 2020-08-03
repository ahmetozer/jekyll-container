# Jekyll Container

This container is created for my jekyll based websites.  
I get a performance issue on jekyll official repo, so i build my self.

This container has a multiple platforms support. {amd64,arm}
You may use in also Raspberry Pi or like devices (Orange Pi, Banana Pi)

For using empty container, just run in docker.

```bash
docker run -it ahmetozer/jekyll
```

To embed your projects, set `FROM` in docker file to `ahmetozer/jekyll`.

```docker
FROM ahmetozer/jekyll
```
