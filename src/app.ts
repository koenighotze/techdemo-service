import express from 'express'
const app = express()
app.set('port', process.env.PORT || 3000)

app.get('/hello', (req, res) => res.send('hello world'))

export default app
