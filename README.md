Internal DSL's
==============
Ruby is an excellent language for creating internal DSL's. 

However as a first time user to Ruby AND to internal DSL's it can be a bit confusing. 

Often it is difficult to understand if the code relates to the DSL or the underlying language.

There were several articles that helped me out here
- Martin Fowler DSL articles
- Seth Vargo Cleanroom pattern (not used in any of my examples)
- S Gunther and T Cleenewerck Design Principles for Internal DSL languages
- Metaprogramming Ruby by Paolo Perrotta

And the open source project of Chef and it's DSL. 

As I became acustomed to using an internal DSL in Ruby I noticed that several of the patterns were found in other DSL's such as Sinatra and HAML.
What I also learnt was that when using DSL's you should not under-estimate the value of the underlying language, in my case Ruby.
Learning the Ruby eco-system, syntax and tooling will add a great deal of value in using the DSL's on a day to day basis and will make debugging much easier.

The code herein is just a little DSL, even from such a small project I got a lot out of this such as understanding Ruby blocks which are the core of the power of DSL's. 

Requirements
------------
Needs Ruby, the easiest way to obtain this for Linux or Windows is to install ChefDK (https://downloads.chef.io/chef-dk/)

License and Authors
-------------------
Authors: Chris Sullivan