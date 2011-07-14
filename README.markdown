Introduction
============

acts_as_activecomplete is an intelligent autocompletion plugin for Rails. It personalizes autocompletion on any model class using document statistics.
Currently, acts_as_activecomplete is being tested on Rails 2.3.11. Feel free to fork the repository and submit patches or improvements.

Resources
=========

- Github: http://github.com/nitindhar7/acts_as_activecomplete
- Blog: http://coding-sense.blogpost.com

Usage
=====

Setup
-----

Add the acts_as_activecomplete helper method for each model that you wish to enable autocompletion on. This helper method also
accepts parameters, each of which is a column, that will be used for autocompletion.

    class Product
        acts_as_activecomplete :name, :description
    end

After the initial setup, run

    rake activecomplete:build:words['Product']

The 'build:words' rake task create a words index for the given models' columns. Currently, only one model per task is accepted, however this will be changed
very soon.

     rake activecomplete:build:correlations['Product']

The 'build:correlations' rake task create a correlations index for the given model. Each consecutive tuple of words will be recorded and metrics will be stored.

===========================================================
Copyright © 2011 Nitin Dhar, released under the MIT license