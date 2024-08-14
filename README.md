# Table of Contents
* [Introduction](#nvidia-ai-workbench-introduction)
   * [Project Description](#project-description)
   * [Sizing Guide](#sizing-guide)
* [Quickstart](#quickstart)
   * [Prerequisites](#prerequisites)
   * [Tutorial (Desktop App)](#tutorial-desktop-app)
   * [Tutorial (CLI-Only)](#tutorial-cli-only)
* [License](#license)

# NVIDIA AI Workbench: Introduction

<!-- Banner Image -->
<img src="https://developer-blogs.nvidia.com/wp-content/uploads/2024/07/rag-representation.jpg" width="100%">

<!-- Links -->
<p align="center"> 
  <a href="https://www.nvidia.com/en-us/deep-learning-ai/solutions/data-science/workbench/" style="color: #76B900;">:arrow_down: Download AI Workbench</a> •
  <a href="https://docs.nvidia.com/ai-workbench/" style="color: #76B900;">:book: Read the Docs</a> •
  <a href="https://docs.nvidia.com/ai-workbench/user-guide/latest/quickstart/example-projects.html" style="color: #76B900;">:open_file_folder: Explore Example Projects</a> •
  <a href="https://forums.developer.nvidia.com/t/support-workbench-example-project-llama-3-finetune/303411" style="color: #76B900;">:rotating_light: Facing Issues? Let Us Know!</a>
</p>

## Project Description
The Llama3-8B model is an advanced LLM developed by Meta that demonstrates SOTA performance on reasoning, code generation, and contextual understanding tasks. In this project, we will focus on finetuning this base model in two ways:

1. ```llama3_finetune_inference.ipynb```: Supervised Full Finetuning (SFT)

    This notebook provides a sample workflow for fine-tuning a full precision Llama3-8B base model using SFT on a subset of the OpenAssistant Guanaco dataset with the intention of improving the model's conversational and instruction following capabilities. Then, you can deploy and test your finetuned model on a vLLM API server.

2. ```llama3dpo.ipynb```: Direct Preference Optimization (DPO)

    This notebook provides a sample workflow for fine-tuning a 4-bit quantized Llama3-8B model using Direct Preference Optimization (DPO).

### What is Direct Preference Optimization (DPO)? 

Traditionally, developers can add reinforcement learning from human feedback (RLHF) to SFT to evaluate, reward, and improve finetuning results. However these algorithms require more data, are less stable, and are computationally expensive!

Direct Preference Optimization improves on a lot of the shortcomings of RLHF. Essentially, DPO treats a task as a classification problem. It uses 2 models: the trained model and a copy called the reference model. During DPO training, the goal is to make sure the trained model outputs higher probabilities for preferred answers and lower probabilities for rejected answers when compared to the reference model.

Because the LLM uses itself as a reward model, it is able to align itself without need for a reward model or extensive sampling and hyperparameter tuning, resulting in a more stable and less computationally intensive process.

| :memo: Remember             |
| :---------------------------|
| This project is meant as an example workflow and a starting point; you are free to swap out the dataset, choose a different task, and edit the training prompts as you see fit for your particular use case! |

## Sizing Guide

| GPU VRAM | Example Hardware | Compatible? |
| -------- | ------- | ------- |
| <16 GB | RTX 3080, RTX 3500 Ada | N |
| 16 GB | RTX 4080 16GB, RTX A4000 | Y (DPO only) |
| 24 GB | RTX 3090/4090, RTX A5000/5500, A10/30 | Y (DPO only) |
| 32 GB | RTX 5000 Ada  | Y (DPO only) |
| 40 GB | A100-40GB | Y (DPO only) |
| 48 GB | RTX 6000 Ada, L40/L40S, A40 | Y (DPO only) |
| 80 GB | A100-80GB | Y |
| >80 GB | 8x A100-80GB | Y |

# Quickstart

## Prerequisites
AI Workbench will prompt you to provide a few pieces of information before running any apps in this project. Ensure you have this information ready. 
   
   * The location where you would like the Llama3-8B models to live on the underlying **host** system. 
   * The Hugging Face API Key w/ Llama3-8B access (see below).

| :exclamation: Important             |
| :---------------------------|
| Verify you can see a "You have been granted access to this model." message on the Hugging Face model cards [here](https://huggingface.co/meta-llama/Meta-Llama-3-8B) and [here](https://huggingface.co/meta-llama/Meta-Llama-3-8B-Instruct); if not, you may need to accept the terms to grant access for your HF token. |

## Tutorial (Desktop App)

If you do not NVIDIA AI Workbench installed, first complete the installation for AI Workbench [here](https://www.nvidia.com/en-us/deep-learning-ai/solutions/data-science/workbench/). Then, 

1. Fork this Project to your own GitHub namespace and copy the link

   ```
   https://github.com/[your_namespace]/<project_name>
   ```
   
2. Open NVIDIA AI Workbench. Select a location to work in. 
   
3. Clone this Project onto your desired machine by selecting **Clone Project** and providing the GitHub link.
   
4. Wait for the project to build. You can expand the bottom **Building** indicator to view real-time build logs. 
   
5. When the build completes, set the following configurations.

   * `Environment` &rarr; `Mounts` &rarr; `Configure`. Specify the file path of the mount, eg. where the Llama3-8B models will live on your **host** machine.
   
      eg. if you would like your finetuned model to be saved in your home path, enter ```/home/[user]``` or ```/mnt/C/Users/[user]``` (Windows)

   * `Environment` &rarr; `Secrets` &rarr; `Configure`. Specify the Hugging Face Token as a project secret.

6. On the top right of the window, select **Jupyterlab**. 

7. Navigate to the `code` directory of the project. Then, open your fine-tuning notebook of choice and get started. Happy coding!

## Tutorial (CLI-Only)
Some users may choose to use the **CLI tool only** instead of the Desktop App. If you do not NVIDIA AI Workbench installed, first complete the installation for AI Workbench [here](https://www.nvidia.com/en-us/deep-learning-ai/solutions/data-science/workbench/). Then, 
1. Fork this Project to your own GitHub namespace and copying the link

   ```
   https://github.com/[your_namespace]/<project_name>
   ```
   
2. Open a shell and activating the Context you want to clone into by

   ```
   $ nvwb list contexts
   
   $ nvwb activate <desired_context>
   ```

   | :bulb: Tip                  |
   | :---------------------------|
   | Use ```nvwb help``` to see a full list of AI Workbench commands. |
   
3. Clone this Project onto your desired machine by running

   ```
   $ nvwb clone project <your_project_link>
   ```
   
4. Open the Project by

   ```
   $ nvwb list projects
   
   $ nvwb open <project_name>
   ```

5. Start **Jupyterlab** by

   ```
   $ nvwb start jupyterlab
   ```
   
   * Specify the file path of the mount, eg. where the Llama3-8B models will live on your **host** machine.
   
      eg. if you would like your finetuned model to be saved in your home path, enter ```/home/[user]``` or ```/mnt/C/Users/[user]``` (Windows)

   * Specify the Hugging Face Token as a project secret.

6. Navigate to the `code` directory of the project. Then, open your fine-tuning notebook of choice and get started. Happy coding!

# License
This NVIDIA AI Workbench example project is under the [Apache 2.0 License](https://github.com/NVIDIA/workbench-example-llama3-finetune/blob/main/LICENSE.txt)

This project may utilize additional third-party open source software projects. Review the license terms of these open source projects before use. Third party components used as part of this project are subject to their separate legal notices or terms that accompany the components. You are responsible for confirming compliance with third-party component license terms and requirements. 

| :question: Have Questions?  |
| :---------------------------|
| Please direct any issues, fixes, suggestions, and discussion on this project to the DevZone Members Only Forum thread [here](https://forums.developer.nvidia.com/t/support-workbench-example-project-llama-3-finetune/303411) |
