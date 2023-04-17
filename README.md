# PSIPRED-4.02

Container definition for PSIPRED version 4.02.# psipred-docker-cwl

This repository provides a [Common Workflow Language (CWL)](https://www.commonwl.org/) tool for running the [PSIPRED protein secondary structure prediction software](http://bioinf.cs.ucl.ac.uk/psipred/). The tool is packaged in a Docker container, allowing it to run on any system with Docker installed.

I do not own the PSIPRED software and it is crucial to note the limitations of the [license](https://github.com/psipred/psipred/blob/master/LICENSE) that restrict the usage to academic purposes.

## Prerequisites

To use this tool, you must have the following software installed on your system:

- [Docker](https://www.docker.com/)

## Installation

To install and run the tool, follow these steps:

1. Clone this repository to your local machine.
2. Install Docker, if you haven't already done so.
3. Build the Docker image by running the following command from the root of the repository:

    ```
    docker build -t psipred-cwl .
    ```

4. Run the CWL tool by running the following command from the root of the repository:

    ```
    cwl-runner psipred.cwl psipred.yml
    ```

   This will run the PSIPRED protein secondary structure prediction software on the input sequence specified in the `psipred.yml` file.

## Usage

To use the tool, you will need to create a YAML file specifying the input sequence and any other parameters you wish to specify. An example YAML file is provided in the `example` directory of this repository.

The `psipred.cwl` file is the main workflow file that describes the steps of the PSIPRED analysis. The `psipred.yaml` file is an example input file that specifies the input sequence and any other options you wish to specify.

The output of the analysis will be written to a directory named `output` in the current working directory.

## Contributing

If you wish to contribute to this project, please follow the standard GitHub workflow:

1. Fork the repository
2. Create a new branch for your changes
3. Make your changes and commit them
4. Push your changes to your fork
5. Submit a pull request to this repository

## License

This project is licensed under the [MIT License](https://github.com/Nihasa/psipred-docker-cwl/blob/main/LICENSE).
Please note the inherited limitations of the [Psipred License](https://github.com/psipred/psipred/blob/master/LICENSE).

## Contact

If you have any questions or feedback, please contact the author via GitHub.
