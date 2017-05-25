# Overview

Conda - is general purpose package version, like brew, rpm, apt-get, but written on python 
and popular among data scientists for it's great Anaconda package containing 
collections of well integrated data science libraries.
   

# Conda
Conda major functions: 
- managing packages, 
- manages python versions 
- managing python virtual environments   
 
 
## Virtual environments 

    conda-env --help

To create an environment, use `conda create -n env_name [list of packages] [python={version}]` in your terminal. 
Here `-n env_name` sets the name of your environment (-n for name) and `list of packages`
is the list of packages you want installed in the environment. 
For example, to create an environment named `tea_facts` with python 3, and install `numpy` in it, 
type:
    
    conda create -n tea_facts numpy python=3

List environments
    
    conda env list
    
Activate environment 

    source activate my_env 

Deactivate environment

    source deactivate
    
Remove environment
    
    conda env remove -n env_name
    
Export environment setup to share with others
    
    conda env export > environment.yaml
    
    

## Managing packages 
    
    conda list
    conda install numpy pandas matplotlib
    conda install jupyter notebook
    
To uninstall, use 

    conda remove package_name
    
To update a package 

    conda update package_name
    
If you want to update all packages in an environment, use 

    conda update --all.    

If you don't know the exact name of the package, try searching it 

    conda search search_term

## Managing conda itself 

    conda upgrade conda
    conda upgrade --all


# Anaconda

Install from [https://www.continuum.io/downloads]()
