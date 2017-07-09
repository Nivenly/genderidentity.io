const path = require('path')
const express = require('express')
const app = express()
const sys = require('sys')
const exec = require('child_process').exec;

app.use(express.static(path.join(__dirname, 'public')))

function puts(error, stdout, stderr) { sys.puts(stdout) }
exec("ls -l /", puts);
exec("jekyll build --source jekyll --destination public -w", puts);

app.listen(80)
