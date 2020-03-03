const express = require('express');
const app = express();
const user = require('./Route/user')
const item = require('./Route/item')



//app.use(express.json())
app.use('/api/users', user)
app.use('/api/items', item)


const port = process.env.port || 3000;
app.listen(port, () => console.log(`runnig on port ${port}`));