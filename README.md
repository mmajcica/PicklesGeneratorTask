# Pickles documentation generator

## Overview

This extension will add a Build/Release task in your TFS/VSTS instance that will allow you to generate Pickles documentation. Task ships with the necessary Pickles executable files.

## Requirements

No specific requirements are present for this task to run.

## The different parameters of the task are explained below:

* **Feature Directory**: Directory to start scanning recursively for features.
* **Documentation Format**: Allows the user to select what format the generated output will be written in. E.g. HTML, Word, DHTML, Excel, etc.
* **Output Directory**: The folder where Pickles will put the generated output. If not specified, by default, is going to be persisted in AGENT_BUILDDIRECTORY in case of a build, meanwhile in case of a release it is going to be placed in AGENT_RELEASEDIRECTORY
* **System Under Test Name**: This is the name of the system under test. Since Pickles is designed to be used with any platform/language that supports Gherkin feature files we cannot rely on reading in an assembly or a jar file to retrieve metadata about the system under test. Instead, The user can use this argument to name the system under test.
* **System Under Test Version**: This is the version of the system under test. Since Pickles is designed to be used with any platform/language that supports Gherkin feature files we cannot rely on reading in an assembly or a jar file to retrieve metadata about the system under test. Instead, The user can use this argument to set a version number for the system under test.
* **Test Results File**: Path to the XML results file. Supports file matching patterns.
* **Test Results Format**: The format used for the report coming out of the test run of the features. There are many different testing frameworks supported by SpecFlow, plus all of the other gherkin style frameworks out there. NUnit and xUnit output formats are accepted as well as output from MsTest and SpecRun. As of version 2.4, Pickles also supports output from VsTest.Console.exe, the new command line runner introduced by Visual Studio 2012.
* **Language**: Allows the user to tell Pickles the default language of the .feature files. Any language settings inside the .feature files take precedence.
* **Enable Comments**: As of version 2.6, Pickles includes Gherkin #-style comments. As of version 2.7, this inclusion is configurable.
* **Include Experimental Features**: As of version 2.5, Pickles includes experimental features. The goal of experimental features is to get rapid feedback about ideas. They are subject to change or removal at any time. The experimental features are not always completely thought through - including them and receiving feedback about them enables us to make better decisions about those features. This argument is a flag. Including the argument means that the experimental features should be included. If the argument is not included, then the experimental features will not be included.

## Release notes

* 1.0.3 - Fixed an issues where output dir couldn't be insisting path [#3](https://github.com/mmajcica/PicklesGeneratorTask/issues/3). Pickles binaries upgraded to v2.20.1 [#1](https://github.com/mmajcica/PicklesGeneratorTask/issues/1). Test result file parameter now accepts advanced pattern matching in order to allow for the file search [#2](https://github.com/mmajcica/PicklesGeneratorTask/issues/2)
* 1.0.2 - Improved markdown file. No changes for the build task
* 1.0.1 - Minor improvements on the extension. No changes for the build task
* 1.0.0 - Initial Release - Ships with Pickles 2.18.0

## Contributing

Feel free to notify any issue in the issues section of this GitHub repository. In order to build this task, you will need Node.js and gulp installed. Once cloned the repository, just run 'npm install' then 'gulp package' and in the newly created folder called _packages you will find a new version of the extension.
