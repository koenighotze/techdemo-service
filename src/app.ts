import express from 'express'
import expressHealthcheck from 'express-healthcheck'
import errorHandler from 'errorhandler'

const app = express()
app.set('port', process.env.PORT || 3000)

app.get('/hello', (req, res) => res.send('hello world'))

app.get('/healthz', expressHealthcheck({
  healthy: () => ({ status: 'ok' }),
  test: () => 0
}))

if (process.env.NODE_ENV === 'development') {
  app.use(errorHandler())
}

export default app
