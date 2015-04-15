ProjectEuler
============
Current status of solutions: [![Build Status](https://travis-ci.org/g2graman/ProjectEuler.svg?branch=master)](https://travis-ci.org/g2graman/ProjectEuler) [![Coverage Status](https://coveralls.io/repos/g2graman/ProjectEuler/badge.svg)](https://coveralls.io/r/g2graman/ProjectEuler)

This repository contains my answers to the problems of Project Euler. In each of the hosted directories there is a file named `answer.txt` which holds the answer to the corresponding problem on ProjectEuler. I added those files after solving the problems to verify that my solutions to those problems would not regress.

I understand that in some cases I have not achieved optimal complexity, but I hope to rectify this in future commits. My first goal is to solve a problem and only immediately optimize its solution if it is not laborious to come up with its optimization.

Bulk-testing has been set up in such a way that only the directories with an `answer.txt` file (in their root) get tested. That said, one may notice from time to time that a solution's `answer.txt` was moved to a a sub-folder to prevent its immediate detection in order to omit it from bulk-testing (possibly due to latency risks). One might hold that this is not an elegant solution to creating a testing framework for the solutions to these problems, but it is in-fact the simplest and an omitted test case should only be a temporary one at that.
