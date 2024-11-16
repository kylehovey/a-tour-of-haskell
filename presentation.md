# A Tour of Haskell

# To Begin...

Entertain me for a bit:

* Set aside existing intution
* Pretend we're new to programming

# Philosophy

What makes a good programming language?

# Philosophy

What makes a good programming language?

1. We all have finite energy

# Philosophy

What makes a good programming language?

1. We all have finite energy
2. That energy is valuable, both in money and our own time

# Philosophy

What makes a good programming language?

1. We all have finite energy
2. That energy is valuable, both in money and our own time
3. We have tools to provably prevent classes of errors

# Philosophy

We should use the tools we have so that our energy can be used on unsolved problems rather than solved ones.

# Pit of Success

Original source: [Pit of Success](https://blog.codinghorror.com/falling-into-the-pit-of-success/)

Language choices have a profound impact on:
* Readability - Forming a sound understanding from the code
* Evolvability - The path of least resistance to making a change

# Pit of Success

A bad understanding leads to poor design, and a path of least resistance without safety leads to bugs.

# Pit of Success

A bad understanding leads to poor design, and a path of least resistance without safety leads to bugs.

Hard to read code then begets more hard to read code, the stable attactor is Spaghetti.

# Errors

Programming is hard, things _will_ blow up.

# Errors

Programming is hard, things _will_ blow up. We can't choose when, but we can often choose _where_.

# Errors

If possible:

* Code should blow up in our faces, not the users' faces.
* If possible, the language expresses not only procedure but _intent_.

# Errors

The compiler should convert intent into:

* Safeguards
* Helpful tips for developers

# Complexity

Complexity is not a war we can win totally.

* A language should not aim to eliminate complexity.
* All problems demand [a nonzero amount](https://en.wikipedia.org/wiki/Essential_complexity).

# Complexity

Instead, we focus on optimizing how we express complexity.

# Haskell

Haskell is one of our best attempts at designing a language with these goals in mind.

# Haskell

Haskell is one of our best attempts at designing a language with these goals in mind.

* Expressive type system

# Haskell

Haskell is one of our best attempts at designing a language with these goals in mind.

* Expressive type system
* Composable concepts (you can combine existing code easily)

# Haskell

Haskell is one of our best attempts at designing a language with these goals in mind.

* Expressive type system
* Composable concepts (you can combine existing code easily)
* A rich standard library

# Haskell

Haskell is one of our best attempts at designing a language with these goals in mind.

* Expressive type system
* Composable concepts (you can combine existing code easily)
* A rich standard library
* A vibrant and helpful community of nerds like you

# Haskell

Without further adieu...
