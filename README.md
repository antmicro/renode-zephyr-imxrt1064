# Renode simulation of Zephyr on i.MX RT1064 Evaluation Kit

Copyright (c) 2021 [Antmicro](https://www.antmicro.com/)

This repository contains a script and test suite to simulate [Zephyr](https://github.com/zephyrproject-rtos/zephyr) on Cortex-M i.MX RT1064 SoC in [Renode](https://renode.io).

## Building

To test it locally, build [the latest Renode version](https://github.com/renode/renode/tree/master) from GitHub repository. For build instructions, please refer to [documentation](https://renode.readthedocs.io/en/latest/advanced/building_from_sources.html).

You can also use one of the pre-built [nightly packages](https://builds.renode.io).

To build Zephyr samples, run:

```
./prepare_zephyr.sh
./build_binaries.sh
```

Please not that the ``prepare_zephyr.sh`` script will install build dependencies on your host system.

## Usage

To start the simulation, run the following in Renode:

```
(monitor) s @mimxrt1064-evk.resc
```

This will run a Zephyr shell sample bundled with [Zephyr source-code](https://github.com/zephyrproject-rtos/zephyr) on i.MX RT1064 Evaluation Kit in Renode.

To run sample test cases, run the following command in your console:

```
path-to/renode/test.sh mimxrt1064-evk.robot
```

or fork this project and observe results in GitHub Actions CI workflow.

## Running the simulation

You should be greeted with the following prompt on UART:

```
uart:~$
```

You can list all available commands using the `help` command.
