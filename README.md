# grunt-webdrivercssreport

> Generate webdrivercss report

Generate an HTML file containing all failed screenshots, layout based on photobox.

## Getting Started
This plugin requires Grunt `~0.4.5`

If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process, you may install this plugin with this command:

```shell
npm install grunt-webdrivercssreport --save-dev
```

Once the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```js
grunt.loadNpmTasks('grunt-webdrivercssreport');
```

## The "webdrivercssreport" task

### Overview
In your project's Gruntfile, add a section named `webdrivercssreport` to the data object passed into `grunt.initConfig()`.

```js
  webdrivercssreport: {
    test: {
      options: {
        template: 'template.tpl',
        indexPath: '',
        failuresPath: 'failures'
      },
      files: {
        'baseline': ['baseline/**/*baseline*'],
        'failures': ['baseline/**/*regression*']
      }
    }
  }
```

### Options

#### options.template
Type: `String`
Default value: `'template.tpl'`

Template to use for the output.

#### options.indexPath
Type: `String`
Default value: `''`

Location to store the generated index.html.

#### options.failuresPath
Type: `String`
Default value: `'failures'`

Location of the failure screenshots.

### Usage Examples

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality. Lint and test your code using [Grunt](http://gruntjs.com/).

## Release History
_(Nothing yet)_
