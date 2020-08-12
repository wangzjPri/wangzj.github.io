## Using virtualenv in jupyter Notebook

1. switch to virtualenv using cmd: conda activate myenv
2. install ipykernel: pip install ipykernel
3. add virtualenv to notebook:  
>python -m ipykernel install --user --name=tensorflow
>Installed kernelspec tensorflow in C:\Users\namco\AppData\Roaming\jupyter\kernels\tensorflow
4.now it should be able to choose the new tensorflow kernel when starting a new notebook
