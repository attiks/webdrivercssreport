<html>
<head>
  <title>Webdriver css report</title>
  <style type="text/css">
    * {
      box-sizing: border-box;
    }

    body {
      font-family: Helvetica;
      font-size: 14px;
      font-weight: 200;
    }

    h1 {
      height: 60px;
      margin: 1em 1% 0 1%;
      color: #2E708A;
      position: relative;
      line-height: 60px;

      font-size: 2em;
      font-weight: 200;

      background-color: #F3CD60;

      box-shadow: 0 1px 1px #555;
      padding: 0 0.5em;
    }

    h2 {
      margin: 0;
      padding: 0;
      font-weight: 200;

      text-align: center;

      padding: 0.5em;
      color: #fff;
      background-color: #0F3340;
      box-shadow: inset 0 1px 2px #000;
    }

    main {
      width: 98%;
      margin: 0 auto;
      position: relative;

      background-color: #2E708A;
    }

    .row {
      width: 100%;

      padding: 0;
      margin: 0 0 2% 0;
    }

    .col {
      display: inline-block;
      width: 30%;
      margin-left: 3.333%;

      position: relative;

      vertical-align: top;
    }

    .col img {
      width: 100%;

      box-shadow: 0 1px 1px #333;
    }

    .colContainer {
      position: relative;
      width: 100%;
      margin-left: -1.666%;
      clear: both;
    }

    .name {
      font-size: 2em;

      padding: 0.5em 0.5em 0.5em 1em;
      margin: 1em 0 0 -0.0625em;

      background-color: #F4882D;
      box-shadow: 0 1px 1px #333;
    }

    .tags {
      padding: 20px 10px 0;
    }

    .tags label {
      border: solid 1px #323232;
      background-color: #434343;
      color: #fff;
      padding: 5px;
      margin: 10px;
      box-shadow: 0 1px 1px #333;
    }

    .tags input[type="radio"] {
      display: none;
    }
  </style>
</head>
<body>
  <h1>webdrivercss report</h1>
  <main class="">
    <div class="tags">
      <label><input type="radio" name="tag" value="row" checked="checked">Show all</label>
      <% _.forEach(templateData.tags, function(tag) { %>
        <label><input type="radio" name="tag" value="<%= tag %>"><%= tag %></label>
      <% } );%>
    </div>
    <% _.forEach(templateData.sets, function(data) { %>
      <div class="row <%= data.tags.join(' ') %>" >
        <div class="name"><%= data.key %></div>
        <div class="colContainer">
          <div class="col">
            <h2>Baseline</h2>
            <img src="<%= data.src %>?<%= now %>">
          </div><div class="col">
            <h2>Difference</h2>
            <img src="<%= data.dif %>?<%= now %>">
          </div><div class="col">
            <h2>Regression</h2>
            <img src="<%= data.reg %>?<%= now %>">
          </div>
        </div>
      </div>
    <% } );%>
  </main>

  <script type="text/javascript">
    (function(){
      'use strict';
      var tagList = document.querySelectorAll('input[name="tag"]');
      for (var i = 0; i < tagList.length; i++) {
        tagList[i].onclick = function () {
          var tag = this.value;
          var divs = document.querySelectorAll('.row');
          for (var j = 0; j < divs.length; j++) {
            console.log(divs[j]);
            if (divs[j].classList.contains(tag)) {
              divs[j].style.display = 'block';
            }
            else {
              divs[j].style.display = 'none';
            }
          }
        }
      }
    })();
 </script>

</body>
</html>
