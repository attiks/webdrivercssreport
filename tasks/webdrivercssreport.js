/*
 * grunt-webdrivercss-report
 * https://github.com/attiks/webdrivercssreport
 *
 * Copyright (c) 2015 Peter Droogmans
 * Licensed under the MIT license.
 */

'use strict';

module.exports = function(grunt) {

  var path = require('path');

  grunt.registerMultiTask('webdrivercssreport', 'Generate webdrivercss report', function() {
    var options = this.options({
      template: 'template.tpl',
      indexPath: '',
      failuresPath: 'failures'
    });

    var data = {
      baseline: {},
      failures: {}
    };

    this.files.forEach(function(f) {
      f.src.filter(function(filepath) {
        // Warn on and remove invalid source files (if nonull was set).
        if (!grunt.file.exists(filepath)) {
          grunt.log.warn('Source file "' + filepath + '" not found.');
          return false;
        } else {
          return true;
        }
      }).map(function(filepath) {
        var filename = filepath.match(/\/([^/]*)$/)[1];
        filename = filename.substr(0, filename.lastIndexOf('.')) || filename;
        // Skip baseline and regression.
        var basename = filename.substr(0, filename.lastIndexOf('.')) || filename;
        data[f.dest][basename] = {
          'src': filepath,
          'tags': basename.split('.')
        };
      });
    });

    var baseline = data['baseline'];
    var failures = data['failures'];
    var unchanged = JSON.parse(JSON.stringify(baseline));
    var allTags = [];

    Object.keys(failures).forEach(function (k) {
      delete unchanged[k];
      failures[k]['key'] = k;
      failures[k]['reg'] = baseline[k]['src'];
      failures[k]['dif'] = options.failuresPath + '/' + k + '.diff.png';
      allTags = allTags.concat(failures[k]['tags'].filter(function (item) {
        return allTags.indexOf(item) < 0;
      }));
    });

    var templateData = {
      sets: failures,
      tags: allTags
    };

    grunt.file.write(
      options.indexPath + 'index.html',
      grunt.template.process(
        grunt.file.read(path.dirname( __dirname ) + '/' + options.template),
        { data : {
          now          : + new Date(),
          options      : options,
          templateData : templateData
        } }
      )
    );

  });

};
