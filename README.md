### TL;DR

**Install**

```
npm install --save hubot-response
```

**Register**

In `external-scripts.json` add

```
"hubot-response"
```

**Make your own responses**

Create a `responses` directory. Create `mysweetresponse.json` and add

```
{
  "match": "Hello",
  "listener": "hear",
  "response": [
    "World!"
  ]
}
```

Now when hubot hears `Hello` in the room, it replies back with `World!`. Run `npm start` to try it out!



Say you have this awesome [business-cat](https://github.com/hubot-scripts/hubot-business-cat) script, but *really* want to add an image.

You have 3 options:
- Copy and paste the script into your hubot scripts folder.
- Fork it and add it. Then deal with merge conflicts.
- Submit a pull request, but maybe no one else want's your stupid cat picture?

#### Solution

### Environment Variables
`HUBOT_RESPONSE_GLOB` - [`Glob`](https://github.com/isaacs/node-glob) of where to look for responses. Defaults to `responses/*.*`
