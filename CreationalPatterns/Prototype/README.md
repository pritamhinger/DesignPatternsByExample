# Common question and their answers on Prototype Patterns
## What is Prototype Pattern?
> This Pattern creates a new object by copying an existing object (which is known as Prototype)

## What are the benefits?
> The main benefit is to hide the code that creates an object from the components that use them; this means that component don't need to know which class or struct is required to create a new object, don't need to know the details of initializers, and don't need to change when subclasses are created and instatiated. This pattern can also be used to avoid repeating expensive initialization each time a new object of a specific type is created.

## When to use this pattern?
> This pattern is useful when you are writing a component that needs to create new instances of objects without creating a dependancy on the class initializer.

## When this pattern should be avoided?
> Well there is no drawback of this pattern as such. 

## How one knows if the pattern has been implemented correctly or not?
> One way to test the implementation of this pattern is to change the initializer of the class or struct used for the prototype object and check to see whether a corresponding change is required in the component that creates the clones.

## Are there any common pitfalls?
> The main pitfall is selecting wrong style of copying when cloning the prototype object. The two kinds of copying are - **shallow and deep copying** - and it is important to select the correct kind for your application.

## What all are the related patterns?
> Most closely related is the Object Template pattern. Singleton Pattern could be the other pattern in which only a single instance is created.


