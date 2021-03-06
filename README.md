# Pre-release Data Commons R API Client

Thank you for your interest in the Data Commons R API Client. This library is currently in beta mode. We will release and switch support to an official release soon.

This R API Client facilitates querying the [DataCommons.org](https://datacommons.org)
Open Knowledge Graph from R.

Querying the graph via [SPARQL](https://en.wikipedia.org/wiki/SPARQL)
queries to the Data Commons REST API endpoint go through the `query` function. For example:

```
# Populate a data frame with columns specified with SPARQL
queryString = "SELECT ?pop ?Unemployment
    WHERE {
     ?pop typeOf StatisticalPopulation .
     ?o typeOf Observation .
     ?pop dcid ('dc/p/qep2q2lcc3rcc' 'dc/p/gmw3cn8tmsnth' 'dc/p/92cxc027krdcd') .
     ?o observedNode ?pop .
     ?o measuredValue ?Unemployment
   }"
df = query(queryString)
```

Calls to the Data Commons Node API endpoint are facilitated by functions:

- `get_triples`: get all triples (subject-predicate-object) where the specified node is
  either a subject or an object.
  
- `get_property_values`: get values neighboring each specified node via the specified
  property and direction.
  
- `get_property_labels`: get property labels of each specified node.

- `get_places_in`: get places of a specified type contained in each specified place.

- `get_populations`: get populations of each specified place.

- `get_observations`: get observations on the specified property of each node.

For example:
```
# DCID string of Santa Clara County
sccDcid <- 'geoId/06085'
# Get incoming properties of Santa Clara County
inLabels <- get_property_labels(sccDcid, out = FALSE)
```

WiFi is needed for all functions in this package. For more detail on usage of any of these functions, use `help(function)` in the R console, or the shortcut `?function`.


## User Quickstart

### Getting an API Key

Using the Data Commons API requires you to provision an API key on GCP, in
addition to enabling Data Commons API for your GCP project. Follow the steps
[here](http://docs.datacommons.org/api/setup.html).

### Installing

#### Downloading the Pre-Built (tar.gz) Library

If you received a tar.gz file from us,

1. Go to the R console to install the CRAN dependencies:
```
install.packages(c("tidyverse", "httr", "jsonlite", "reticulate"))
```

2. Go to the command line to install the Data Commons API R Client via the tar.gz file:

```
R CMD INSTALL <the tar.gz file>
```

3. Return to the R console to load in the client and set the API key so you can get started:
```
library(datacommons)
set_api_key("YOUR-API-KEY")
```

#### Using the R devtools Library

The devtools library requires some development tools (for Windows: Rtools, for Mac: Xcode command line tools, for Linux: R development package). If you have not already installed them, follow [the devtools guide](https://www.rstudio.com/products/rpackages/devtools/).

To see what tags are available, you can run `git tag`. We will also keep tag information updated in [CHANGELOG.md](CHANGELOG.md).

Go to the R console, replace `<TAG>` with your tag, and run:

```
if(!require(devtools)) install.packages("devtools")
library(devtools)
devtools::install_github("datacommonsorg/api-r@<TAG>", subdir="datacommons")
library(datacommons)
set_api_key("YOUR-API-KEY")
```

#### Cloning and Building from GitHub

To see what tags are available, you can run `git tag`. We will also keep tag information updated in [CHANGELOG.md](CHANGELOG.md).

Replace `<TAG>` with your desired TAG, then go to the Terminal, run:

```
git clone https://github.com/datacommonsorg/api-r.git
cd api-r
git checkout <TAG>
```

The devtools library requires some development tools (for Windows: Rtools, for Mac: Xcode command line tools, for Linux: R development package). If you have not already installed them, follow [the devtools guide](https://www.rstudio.com/products/rpackages/devtools/).

Then, in RStudio, click "File > Open Project..." and select the `datacommons` directory within the cloned `api-r` directory. Alternatively, you can double click the `RClient.Rproj` file in the `api-r/datacommons` directory.

Lastly, in the R console, run:

```
if(!require(devtools)) install.packages("devtools")
library(devtools)
# Make sure you're inside the api-r/datacommons directory
devtools::load_all()
set_api_key("YOUR-API-KEY")
```

#### Tutorial
**We recommend starting with the [Demo Notebook](notebooks/demo-notebook.Rmd) for an
introduction to Data Commons graph, vocabulary, and data model.**
If you did not clone this repo, feel free to download the
[raw Rmd file](https://raw.githubusercontent.com/datacommonsorg/api-r/master/notebooks/demo-notebook.Rmd) and paste it into a new R Markdown file. If you did clone the repo, simply open up the file and run the chunks or knit the file.

We have also provided knitted [HTML](https://github.com/datacommonsorg/api-r/blob/master/notebooks/demo-notebook.html) and [PDF](https://github.com/datacommonsorg/api-r/blob/master/notebooks/demo-notebook.pdf) files for you to view without any interaction.

## To develop on this R API Client {#dev-install}

Data Commons uses the master branch as our development branch.
The suggested development process is to

1. [fork](https://help.github.com/en/articles/fork-a-repo) this [repo](https://github.com/datacommonsorg/api-r),
1. [clone](https://help.github.com/en/articles/cloning-a-repository) your own fork,
1. create a [branch](https://help.github.com/en/articles/about-branches) in your fork,
1. make changes on the branch, and submit a [pull request (PR)](https://help.github.com/en/articles/creating-a-pull-request).

To keep your fork updated, we suggest taking a look at [this guide](https://help.github.com/en/articles/syncing-a-fork).

## Making Changes

### Open the R Project

In RStudio, click "File > Open Project..." and select the `datacommons` directory within the cloned `api-r`           directory.
Alternatively, you can double click the `RClient.Rproj` file in the `api-r/datacommons` directory.

### Load the devtools library

First, make sure you are inside the `api-r/datacommons` directory.

In the R console:

```
if(!require(devtools)) install.packages("devtools")
library(devtools)
```

### To load/reload the code

First, make sure you're inside the `api-r/datacommons` directory.

Keyboard shortcut: `Cmd/Ctrl + Shift + L`

Or in R console, run:
```
devtools::load_all()
set_api_key("YOUR-API-KEY")
```

### To generate/regenerate the docs

First, make sure you're inside the `api-r/datacommons` directory.

Keyboard shortcut: `Cmd/Ctrl + Shift + D` (if this doesn't work, go to
`Tools > Project Options > Build Tools`
and check `Generate documentation with Roxygen`)

Or in R console, run:
```
devtools::document()
```

These commands trigger the roxygen2 package to regenerate the docs based on
any changes to the docstrings in the R/ folder. Here is an
[introduction](https://cran.r-project.org/web/packages/roxygen2/vignettes/roxygen2.html)
to using roxygen2.

### To run tests
1. Make sure you've set your API Key with `set_api_key("YOUR-API-KEY")`.

1. Make sure you're inside the `api-r/datacommons` directory.

1. Run the test suite:

    With keyboard shortcut: `Cmd/Ctrl + Shift + T`

    Or in R console, run:
    ```
    devtools::test()
    ```

### To build the library export tar.gz

In the command line (terminal), `cd` into the `api-r` directory, and run

```
R CMD BUILD datacommons
```

### Working with Reticulate

In `zzz.R`, the Python Client dependency is installed via pip3, but the package
delays loading the python package until the library is first used, so if you'd
like, you can set your Python version in the R console:
```
# Make sure reticulate is loaded
library(reticulate)
# Modify and run the next line:
use_python("/usr/local/bin/python3.7")
```

You can discover available Python versions using the R console:
```
# Make sure reticulate is loaded
library(reticulate)
# This command lists current Python and other versions found
py_config()
```

Reticulate also supports the usage of virtual environments. Learn more at https://rstudio.github.io/reticulate/articles/versions.html
