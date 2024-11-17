# A Tour of Haskell

![dithered-image](https://github.com/user-attachments/assets/2252ea8d-39fe-4e73-adbe-13533b7fcb3a)

This repo contains resources that I use in my "A Tour of Haskell" talk. I use the files in here to give a live demonstration of how we use Haskell to encode our intents when we write code, and how we can work with the compiler to help us evolve our code safely. As a companion to this repo, I [made a blog post](https://kylehovey.github.io/blog/a-tour-of-haskell) going over everything I mention in the talk.

## Setting Up Your Environment

To set up a Haskell Environment to follow along, install [ghcup](https://www.haskell.org/ghcup/) using your package manager of choice. I personally recommend using `ghcup tui` to get an interactive UI for installing:

* `stack` - Your Haskell project management tool. Use this to build your project with `stack build` or simply run it with `stack run`.
* `cabal` - Haskell's library manager, which `stack` uses behind the scenes.
* `ghc` - The Haskell compiler, which also comes with a repl `ghci` or "[GHC Interactive](https://downloads.haskell.org/ghc/9.10-latest/docs/users_guide/ghci.html)".
* `hls` - Haskell's language server which integrates with modern IDE's to give you live errors, type hints, and documentation. 

Make sure you not only install (`i`) the versions recommended by `ghcup tui` but also set (`s`) them as the default.

## Setting Up This Project

Assuming you have set up your enviroment with `ghcup`, you should be able to `stack build` this project. Your IDE should also show you type hints if HLS is properly configured for your IDE.

### Intended Order of Modules

In the live coding demo I go through the contents of the modules in this project to build an intuition for Haskell. The order I go through these modules is:

1. `src/ADT.hs`
2. `src/Pattern.hs`
3. `src/Typeclass.hs`
4. `src/Functor.hs`
5. `src/Applicative.hs`
6. `src/Monad.hs`
7. `Main.hs`

## Running the Presentation

The presentation is built using [Marp](https://marp.app) and exists both as raw markdown source in `presentation.md` and as a slide deck in `presentation.html`. Unless you want to view the raw text, I recommend opening the HTML presentation in your browser after cloning this repo.

## External Resources

### Philisophical Posts

* [Parse, Don't Validate](https://lexi-lambda.github.io/blog/2019/11/05/parse-don-t-validate/) - A post on how to think about type-driven development and encode your intent in your type system
* [Pit of Success](https://blog.codinghorror.com/falling-into-the-pit-of-success/) - One of my favorite analogies when thinking about language design and setting up projects for large teams

### Learning Resources

* [Effective Haskell](https://www.pragprog.com/titles/rshaskell/effective-haskell/) - A pragmatic approach to using Haskell productively by Rebecca Skinner
* [Production Haskell](https://leanpub.com/production-haskell) - A wonderful guide to managing Haskell and using it for production web backends by Matt Parsons
* [Learn You a Haskell for Great Good!](https://learnyouahaskell.com/) - My favorite guide to learning Haskell that does not take itself too seriously

### Academic Stuff

* [Algorithm W Step by Step](https://github.com/wh5a/Algorithm-W-Step-By-Step/blob/master/AlgorithmW.pdf) - A short guide on how to build Haskell's type system
* [Types and Programming Languages](https://www.amazon.com/Types-Programming-Languages-MIT-Press/dp/0262162091) - A great introduction to type systems
