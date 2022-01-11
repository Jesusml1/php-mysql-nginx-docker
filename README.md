# Docker compose environment for PHP, mysql and nginx

## Usage:

1. Clone your workspace project inside this directory.

2. Add your workspace directory to `.gitignore` file.

3. In the `docker-compose.yml` file, replace `workspace-dir-name` with the name of your actual workspace directory.

4. In the `docker-compose.yml` file, replace the env variables for the mysql configuration

```
environment:
      MYSQL_DATABASE: $DATABASE
      MYSQL_USER: $USER
      MYSQL_PASSWORD: $PASSWORD
      MYSQL_ROOT_PASSWORD: $ROOT_PASSWORD
```

5. in the `Dockerfile`, add your `$USER`.

5. Create a folder named `initdb` and put your sql dump inside (optional) 

    `$ mkdir ./initdb` 

6. Run the following command:

    `$ docker compose up --build`

### Note
You can run commands inside the container with `docker compose run`, e.g.:

`$ docker compose run php artisan cache:clear`

Same with npm commands

`$ docker compose run npm run dev`
