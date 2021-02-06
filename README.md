# EmSys Setting up your Lab environment (Take 2) 

Working in the EmSys lab requires you to connect to a specific machine in the Linux lab which has the ESP32 and Logic Analyser attached. 

__See this [list](https://github.com/STFleming/EmSys_labSetup/tree/main/allocations) to find out which machine your group has been allocated to.__ 

First you need to connect to a linux machine via ssh (see section Connecting to your Linux Machine), then you need to setup your environment (see Section Setting up your development environment).

## Connecting to your setup

__Guide for Linux / Mac__
Open a terminal and type in the following
``` 
        ssh <YOUR STUDENT ID>@<ALLOCATED MACHINE>
```

You will be presented with a bash shell running on your Linux machine.

__Guide for Windows__

![](imgs/putty.png)

1. In the ``Host Name (or IP address)`` put the address of your groups allocated machine.

### Development environment setup

The following command will clean up the mess from the last lab and should fully setup your environment.
Copy and paste in to your ssh terminal and execute it.

```
curl -o- https://raw.githubusercontent.com/STFleming/EmSys_labSetup/main/setup.sh | bash -

```


-----------------------------------------

And you should now be ready to go!


### FAQ
* I keep getting ``Unknown cipher type ...`` error? 
> Make sure that you are using capitals for the ssh flags, i.e. use "-X -C" not "-x -c"

