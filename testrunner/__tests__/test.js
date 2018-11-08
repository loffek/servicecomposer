const fetch = require('node-fetch')
const SERVICE_B_URI = process.env.SERVICE_B_URI

test('request body is echoed via serviceb', async () => {
  const resp = await fetch(`${SERVICE_B_URI}/relay`, {method: 'POST', body: 'foobar'})
  const text = await resp.text()

  expect(resp.statusCode).toBe(200)
  expect(text).toBe('foobar')
})
