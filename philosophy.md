# Philosophy

Lotus is an Open Source Software, based on:

* Simplicity
* Few Domain Specific Languages (DLSs)
* Few Conventions
* More objects
* No monkey-patching of the core language and standard lib
* Separation of concerns for Model/View/Controller (MVC) layers

It suggests best practices, but it leaves all the freedom to you, as a developer, to build your own architecture, and use your own objects.

Lotus is made of standalone frameworks (controllers, views, etc..).
Each one is shipped as an **independent** gem.
And each gem can be used by itself.

Lotus makes it easy to use individual modules, in your code, without having to include the whole framework.

## Best Practices

* Favor Composition over Inheritance

### Favor Composition over Inheritance

> When you force your users to inherit from you, you:
>
> * Make it nearly impossible for users to test their logic independently of your framework
> * Make migration away from your framework difficult, or impossible.
>
> ["The Framework Superclass Anti-Pattern" by Micheal Feathers](http://michaelfeathers.typepad.com/michael_feathers_blog/2013/01/the-framework-superclass-anti-pattern.html)

It is important for developers to have the freedom to solve their problems.
Lotus strives to avoid introducing framework integration problems into the list of developer problems.

Lotus makes extensive use of Ruby modules to aid in the composition.
These modules **are**:

* Tested in isolation
* Well-documented
  - via automated tests
  - inline documentation
* Defining an interface definition - methods and signatures – for integration with other components of the various Lotus frameworks
* Providing clear and cohesive behavior

These modules **are not**:

* Junk drawer(s) of behavior piled upon an already overworked object
* Comingled modules that silently depend upon each other

When you are crafting your code, we want you to know what you get from Lotus.
We want you to own your objects, and enrich them with Lotus behaviors.

When you are maintaining your code, we want the explicit nature of module `include` and `extend` to provide clear guideposts for understanding your application.
Both the code you wrote, and how Lotus helped you along the way.
