const fetch = require('node-fetch')
const SERVICE_B_URI = process.env.SERVICE_B_URI

test('request body is echoed via serviceb', async () => {
  const msg = await fetch(`${SERVICE_B_URI}/relay`, {method: 'POST', body: 'foobar'}).then(resp => resp.text())
  expect(msg).toBe('foobar') // Test is failing!
})
