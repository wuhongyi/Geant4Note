## Demo

See the plugin at work here: [Click Here](http://ymcatar.gitbooks.io/gitbook-test/content/testing_mcqx.html)

## Code generator

Syntax too complicated? Use the code generator in the [plugin homepage](http://ymcatar.github.io/gitbook-plugin-mcqx/).

![](http://i.imgur.com/AD1C50h.gif)

## Changelog

* **0.1.0:** Clear history button fixed.

## Feature List

This is a multiple choice plugin developed for GitBook, packed with interactive features including:

* Hints for the questions.
* Cookies support: answered question will be disabled when page load.
* Randomize order of choice.
* Allow adding 2-8 options.
* Allow addition of answer description.
* Dark theme support.
* .pdf, .mobi, .epub export supported.

Another version of the plugin featuring analytics are also in the works. This version will not include this feature. It will be published as a separate plugin.

## Usage

### Code generator

Syntax too complicated? Use the code generator in the [plugin homepage](http://ymcatar.github.io/gitbook-plugin-mcqx/).

### Basic syntax

Each multiple choice question has this basic syntax, they are **not optional**:

```
{%mcq ans="o1"%}
{%title%} This is a question?
{%o1%} First option
{%o2%} Second option
{%o3%} Third option
{%o4%} Fourth option
{%endmcq%}
```

The ```{%mcq%}``` tag (line 1) must have the following arguments for it to work:

* **```ans```**: the id of correct option (possible values: ```o1```,```o2```,```o3```,```o4```,```o5```,```o6```,```o7```,```o8```)

The content of the multiple choice question is included in the book as a sub-block for the mcq tag (line 2 - 7).

* **```title```**: question title (no markdown support for now).
* **```o1```, ```o2```, ```o3```, ```o4```, ```o5```, ```o6```, ```o7```, ```o8```**: text for each options (you can include up to eight optio).

### Display hints

You can add a ```{%hint%}``` sub-block to display a hint message. They will be shown when the user click the "Hint" button.

```
{%mcq ans="o1", count=2%}
{%title%} This is a question?
{%o1%} First option
{%o2%} Second option
{%o3%} Third option
{%o4%} Fourth option
{%hint%} This is a hint.
{%endmcq%}
```

### Display only a certain number of options

You can add an optional ```count``` parameter to the ````{%mcq%}``` tag to show only a certain number of options.

```
{%mcq ans="o1", count=2%}
{%title%} This is a question?
{%o1%} First option
{%o2%} Second option
{%o3%} Third option
{%o4%} Fourth option
{%o5%} Fourth option
{%o6%} Fourth option
{%o7%} Fourth option
{%o8%} Fourth option
{%endmcq%}
```

In this case, only two options will be displayed for the user to choose (the correct answer will always be included). The order of the options will be random (no matter you set the ```random=true``` argument for not).

### Random

You can add an optional ```random=true``` parameter to the ```{%mcq%}``` tag to let the order of the options to be randomized.

```
{%mcq ans="o1", random=true%}
{%title%} This is a question?
{%o1%} First option
{%o2%} Second option
{%o3%} Third option
{%o4%} Fourth option
{%endmcq%}
```
