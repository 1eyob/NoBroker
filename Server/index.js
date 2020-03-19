const express = require('express');
const app = express();
const user = require('./Route/user')
const item = require('./Route/item')
const rentalItem = require('./Route/RentalItem')
const salesItem = require('./Route/salesItem')
const login = require('./Route/login')


//app.use(express.json())
app.use('/api/login', login)
app.use('/api/users', user)
app.use('/api/items', item)
app.use('/api/rentalitems', rentalItem)
app.use('/api/salesitems', salesItem)

const port = process.env.port || 3000;
app.listen(port, () => console.log(`runnig on port ${port}`));