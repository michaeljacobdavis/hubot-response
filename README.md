## Hubot Response

Makes writing hubot scripts as easy as

```
{
  "match": "Hello",
  "listener": "hear",
  "response": [
    "World!"
  ]
}
```

## TL;DR

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

Checkout more [examples](blob/master/examples/).

## Don't we already have [a way of doing this](https://github.com/hubot-scripts)?
Yes, and the [hubot-scripts](https://github.com/hubot-scripts) org is awesome! But for simple hear and respond modules (animated gifs mostly) customization sucks...

Say you want to use this awesome [business-cat](https://github.com/hubot-scripts/hubot-business-cat) script, but *really* want to add an image.

You have 3 options:
- Copy and paste the script into your hubot scripts folder and modify it there.
- Fork it and modify it. Then deal with merge conflicts.
- Submit a pull request, but maybe no one else want's your stupid cat picture?

None of these are really clean.

#### Solution

Since response files are just an object, we can extend however we want. You can see an example of this in the [extension example](blob/master/examples/extension.js).

## Environment Variables
`HUBOT_RESPONSE_GLOB` - [`Glob`](https://github.com/isaacs/node-glob) of where to look for responses. Defaults to `responses/*.*`
