## Hubot Response

Makes writing hubot scripts as easy as

```
{
  "match": "Hello",
  "description": "hello - finish hello world!",
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
  "description": "hello - finish hello world!",
  "listener": "hear",
  "response": [
    "World!"
  ]
}
```

Now when hubot hears `Hello` in the room, it replies back with `World!`. Run `npm start` to try it out!

Checkout more [examples](examples/).

## Environment Variables
`HUBOT_RESPONSE_GLOB` - [`Glob`](https://github.com/isaacs/node-glob) of where to look for responses. Defaults to `responses/*.*`

## How to use
Hubot Response can read anything that can be `reqire`-ed as an object. So `json`, `js`, `coffee` files all work.

The file should export either an object for [**one** response](examples/hello-world.json), or an array for [**multiple** responses](examples/multiple.coffee).

Each response object should consist of:
- `match` - Either a string that is turned into a regex, or an actual instance of `RegExp` that the robot is listening for.
- `description` - Entry for hubot commands. Use this to display with `hubot-help`. See [Commands](https://github.com/github/hubot/blob/master/docs/scripting.md#documenting-scripts) for formatting.
- `listener` - Either [`hear` or `respond`](https://github.com/github/hubot/blob/master/docs/scripting.md#hearing-and-responding).
- `response` - Can be a `String`, `Function` that is called, or an `Array` where an index is randomly selected.

## Try before you buy
Clone this locally and run

```
npm install
npm start
```

This will run a local hubot-shell. You can interact with the [examples](examples/).

**Protip**: Run `hubot-help` for a list of available commands.

## Don't we already have [a way of doing this](https://github.com/hubot-scripts)?
Yes, and the [hubot-scripts](https://github.com/hubot-scripts) org is awesome! But for simple hear and respond modules (animated gifs mostly) customization sucks...

Say you want to use this awesome [business-cat](https://github.com/hubot-scripts/hubot-business-cat) script, but *really* want to add an image.

You have 3 options:
- Copy and paste the script into your hubot scripts folder and modify it there.
- Fork it and modify it. Then deal with merge conflicts.
- Submit a pull request, but maybe no one else want's your stupid cat picture?

None of these are really clean.

#### Solution

Since response files are just an object, we can extend however we want. You can see an example of this in the [extension example](examples/extension.js).
