# Project:	singlecellkernel
### Members:	Svetlana, Yunlong, JP
### Summary:	Positive definite kernel for single-cell RNA-seq data
#### Date created:	Feb 9, 2016


This file describes the directory structure of the repository.

The top level structure is as follows:

* data - static data to be used in running experiments
* doc - manuscript and documentation
* results - results of experiments
* src - source code and general purpose scripts

The progress of the project is summarized in the notebook: [results/notebook.md](results/notebook.md)

The results directory contains one subdirectory for each research result. The name of the directory should by default be the date where the result was obtained, eg, 150317.

There is a makefile in each subfolders that can be called recursively with a make in the general folder. 
Files edited by hand and (small) static data files can be checked into SVN. Larger files should not be checked into SVN; instead, they should be available on a web server and a script to automatically download them should be checked into SVN.
Automatically generated files should not be checked into SVN unless they are (1) very difficult for others to generate, (2) very important, and/or (3) very small.
