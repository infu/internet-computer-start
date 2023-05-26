# Internet Computer | Start

This repository contains a Dev Container (optional) and Blast examples.

## Run in VS Code

Search & install the 'Internet Base' and 'IB Blast Node Kernel' VS Code extensions, so you can open .blast files.

## Run in Codespaces

<img width="306" alt="image" src="https://github.com/infu/internet-base-vsc-examples/assets/24810/942ef446-c80d-41bb-a749-da904723f5f6">

## Run locally in VS Code Dev Container

If you use this to start a new project inside a Dev Container, you can delete everything except the `.devcontainer` directory.

Search & install the 'Dev Containers' extension.

From the left panel choose 'Remote Explorer'

<img width="372" alt="image" src="https://github.com/infu/internet-base-vsc-examples/assets/24810/35bbe8a3-2e8b-4b88-912d-8841718ee751">

Then click 'Open Folder in Container' and 'Open'. It may take a while the first time you do that.

You are in a container made by us which has everything you need to develop on the Internet Computer. Its files are inside `.devcontainer`

It also installs Blast Node Kernel so you can run .blast files inside it. Not using that Kernel while using readFile and readDir will result in errors.

Your terminal should look like this:

<img width="410" alt="image" src="https://github.com/infu/internet-base-vsc-examples/assets/24810/97ea01d5-fee4-4d46-8114-05bd9dd15578">

You can run this command to start dfx:
`dfx start --clean --artificial-delay 0`

Then open another terminal window and install NNS:
`dfx nns install`

Check the .blast files to see what more you can do.

Internet Computer documentation: https://internetcomputer.org

VSCode Dev Containers are explained here https://code.visualstudio.com/docs/devcontainers/containers

Internet Base https://internetbase.org
