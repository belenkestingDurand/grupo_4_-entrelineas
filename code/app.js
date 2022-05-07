const express = require('express')
const app = express()
const port = 3000
const path = require('path')

//views 
const views = path.join(__dirname, 'views/')
//public
const public = path.join(__dirname, 'public/')
const home_html = path.join(__dirname, 'views/home_html/home.html')
//html
const htpptRaiz = '/'
const htpptHome = ''
//html
const homehtml = 'home.html'

const publicPath = path.resolve(__dirname,'./public');
app.use(express.static(publicPath));

//Definir los camions
app.listen(port, () => console.log('Example app listening at http://localhost:'+port))

app.get(htpptRaiz, function(req, res){
    res.sendFile(home_html)
})