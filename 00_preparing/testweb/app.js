const express = require('express')
const app = express()
const port = 8080

conn.connect();

app.set('views', __dirname + '/views');
app.use(express.static('views'));

app.get('/',function(req,res){
    res.render('index.html')
});

app.listen(port, () => {
    console.log('서버 실행 중, PORT: ' + port)
})



