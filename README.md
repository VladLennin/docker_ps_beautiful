# This is function for beutiful output  of command docker ps

#### If you need, you can write this method for global access, for this just add followed code to end of your ```~/.bashrc```, then you have to reload your ```.bashrc``` configuration ```source ~/.bashrc```

#### if you make this, you can access to the method just by writing ```docker_ps``` in your command line,
#### in another way you have to use the whole path and call it from your script file (not comfortable😩)


#### There i left comments how to add your containers and colors:

```
docker_ps() {
    # If you need you can change output format with your requirements
    docker ps --format 'table {{.Names}}\t{{.Status}} : {{.RunningFor}}\t{{.ID}}\t{{.Image}}' | \
    awk '
        BEGIN {
            # Here you are to define colors for output of your containers
            SKYBLUE="\033[1;36m";  # Bright Cyan 
            RED="\033[31m";        # Red
            BRIGHT_YELLOW="\033[1;33m";  # Bright Yellow
            RESET="\033[0m";
        }
        # Here you are to add your directories where you store your docker-compose.yml and
		# all containers directories with Dockerfile
        /some-project/ { print SKYBLUE $0 RESET; next }
        # Here i had containers which dont have any Dockerfile (such databases or something),
		# so i decided to color their output by container name
        /mysql-db/ { print SKYBLUE $0 RESET; next }
        /another-mysql-db/ { print RED $0 RESET; next }
        { print $0 }
    '
}

```

### After all made work you can use your script just by using ```docker_ps``` in your command line which is more convinient for using then classic output 🎉🎉
