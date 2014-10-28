# Event Bus Challenge

1. The goal is to build a very simple PubSub/event class in ruby. We will create an EventEmitter object and then we'll subscribe to events and trigger them. Subscribing to an event simply adds a callback to be run when the event is triggered. Triggering an event (emit) should run all the attached callbacks.
2. *Don't overthink it*. The solution should only take a few minutes and a few lines of code. Build only what you need to get the desired ouput.

Attached is a valid ruby script. You can edit in browser or on local ruby file. When you have it working, make sure you update your solution so we can see it. Let us know how long it takes you to finish it.


## Desired Output

```
Error 1. Second error.
Error 1. Yet another error.
Error 2. Yet another error.
SUCCESS! Great success!
```

## Constraints
1. Although we only use error/success events, please build the class to handle arbitrary events.
2. event data will always be a hash
3. The syntax to call a proc is: proc.call(data)


If you run into any roadblocks. Please let me know if you have any questions!