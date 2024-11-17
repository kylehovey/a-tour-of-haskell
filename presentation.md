---
marp: true
theme: uncover
class: invert
---

# A Tour of Haskell

![Haskell Logo](./featured-image.png)

---

## To Begin...

* Set aside existing intution
* Pretend we're new to programming

---

## Philosophy

#### What makes a good programming language?

* We all have finite energy
* Energy is valuable, in both time and money
* We have solved many problems/errors already

---

## Philosophy

We should use the tools we have so that our energy can be used on unsolved problems rather than solved ones.

---

## Code Stewardship

### 🍝

The two worst outcomes leading to a cycle of spaghetti:

* Poor readability leading to unsound understandings of the code
* A path of least resistance with easily accessible foot-guns

---

## Pit of Success

Our language choices have an impact on:

* **Readability** - Forming a sound understanding from the code
* **Evolvability** - The path of least resistance to making a change

---

## Errors

### 💣

* Programming is hard, things _will_ blow up.
* We can't choose when, but we can often choose _where_.

---

## Errors

If possible:

* Code should blow up in our faces, not the users' faces.
* If possible, the language expresses not only procedure but _intent_.

---

## Errors

The compiler should convert intent into:

* Safeguards
* Helpful tips for developers

---

## Complexity

Complexity is not a war we can win totally.

* A language should not aim to eliminate complexity.
* All problems demand a nonzero amount of it.
* Instead, we focus on optimizing how we express complexity.

---

## Haskell

Haskell is one of our best attempts at designing a language with these goals in mind.

* Expressive type system
* Composable concepts (combine existing code easily)
* A rich standard library
* A vibrant and helpful community of nerds like you

---

## Haskell

Without further ado...
