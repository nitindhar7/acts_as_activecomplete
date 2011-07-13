Introduction
============

acts_as_activecomplete is an intelligent autocompletion plugin for Rails. It personalizes autocompletion on any model class using document statistics.
Currently, acts_as_activecomplete is being tested on Rails 2.3.11. Feel free to fork the repository and submit patches or improvements.

Resources
=========

- Github: http://github.com/nitindhar7/acts_as_activecomplete

Usage
=====

Setup
-----

    class Product
        acts_as_activecomplete :name, :description
    end
    
    rake activecomplete:setup

===========================================================
Copyright © 2011 Nitin Dhar, released under the MIT license