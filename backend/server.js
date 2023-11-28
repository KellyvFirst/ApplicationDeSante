require('dotenv').config();
const express = require('express');
const mongoose = require('mongoose');
const axios = require('axios');

const app = express();
app.use(express.json());

mongoose.connect(process.env.MONGODB_URI, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => console.log('Connected to MongoDB'))
  .catch(err => console.error('Could not connect to MongoDB', err));

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
const Message = require('./models/messageModel');

// Route pour envoyer un message
app.post('/messages', async (req, res) => {
  try {
    const { text } = req.body;

    // Appel à l'API OpenAI
    const response = await axios.post('https://api.openai.com/v1/engines/davinci/completions', {
      prompt: text,
      max_tokens: 150
    }, {
      headers: {
        'Authorization': `Bearer ${process.env.OPENAI_API_KEY}`
      }
    });

    const message = new Message({
      text,
      response: response.data.choices[0].text.trim()
    });

    await message.save();
    res.send(message);
  } catch (error) {
    res.status(500).send(error.message);
  }
});
