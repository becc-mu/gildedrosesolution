gildedrosesolution
==================

A solution to the ruby gilded rose kata

Complying with the rules -
You cannot touch the Item class or items property, something something hobgoblins

I wanted to

1. Refactor - I need to backfill tests. This is a requisite for refactoring.
2. Come up with a way to incrementally improve the code. Small, confident changes.

In the end, it became clear to me that if I created a factory, I could apply a decorator for the individual rules.
Also, I could split the logic in the main loop such that if it was not an instance of the goblin's 'Item' class,
I could have it call the logic necessary on the derived classes.

So, I created a sane class the dereived from Item that could apply the basic rules, and decorated it with the various
requirements (Aged Brie, Backstage passes, etc).

This was done incrementally, and every line of code was driven by RSpec requiring it to be written.

I hope this helps someone, please feel free to ping me with any questions.

I'm sure there are plenty of improvements to be made - the last time I touched RSpec or wrote more than a couple lines of Ruby was about a year ago (see my Conway project). If you have suggestions for improvement I would welcome them.
